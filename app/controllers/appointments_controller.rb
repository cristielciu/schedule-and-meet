class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    
    if @appointment.save
      flash[:success] = 'Appointment created'
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def show
    @appointment = Appointment.find_by(url_token: params[:key])
    if @appointment
      if @appointment.user_answered(request.remote_ip)
        flash[:notice] = 'Already submitted a vote'
        @answer = @appointment.answer_for_user(request.remote_ip)
      else
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