class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    
    if @appointment.save
      token = current_user.facebook_api_key
      group_id = current_user.group_id
      @appointment.post_on_facebook(token, group_id)
      flash[:success] = 'Appointment created'
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def show
    @appointment = Appointment.find_by(url_token: params[:key])
    token = cookies[:user_token]
    user_token = "#{request.remote_ip}-#{token}" if token
    if @appointment
      if token && @appointment.user_answered(user_token)
        flash[:notice] = 'Already submitted a vote'
        @answer = @appointment.answer_for_user(user_token)
      else
        cookies[:user_token] ||= "#{request.remote_ip}-#{rand(999_999_999)}"
        @answer = @appointment.answers.new
      end
    end
  end

  def edit
    @appointment = Appointment.where(id: params[:appointment_id]).first
    if @appointment.blank?
      redirect_to root_path
    end
  end

  def update
    appointment = Appointment.find(params[:appointment][:id])
    
    if appointment.update(appointment_params)
      flash[:success] = 'Appointment updated'
      redirect_to root_path
    else
      flash[:error] = 'error'
    end
  end
  private
  
  def appointment_params
    attrs = params.require(:appointment).permit(:name, :description)
    attrs[:starts_at] = DateTime.new(
      params[:appointment][:year].to_i, 
      params[:appointment][:month].to_i, 
      params[:appointment][:day].to_i, 
      params[:appointment][:hour].to_i, 
      params[:appointment][:minute].to_i
    ).to_s

    attrs[:creator_id] = current_user.id

    attrs
  end
end