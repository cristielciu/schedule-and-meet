class AnswersController < ApplicationController
  def create
    answer = Answer.new(answer_params)

    if answer.save
      flash[:success] = 'Answer submitted'
      redirect_to root_path
    else
      flash[:error] = answer.errors.full_messages.join(', ')
      redirect_to appointment_path(key: appointment_key)
    end
  end

  def update
    answer = Answer.find(params[:answer][:id])

    if answer.update(answer_params)
      flash[:success] = 'Answer updated'
      redirect_to root_path
    else
      flash[:error] = answer.errors.full_messages.join(', ')
      redirect_to appointment_path(key: appointment_key)
    end
  end

  private
  
  def answer_params
    attrs = params.require(:answer).permit(:attempting, :user_name, :guests, :appointment_id)
    attrs[:user_ip] = request.remote_ip

    attrs
  end

  def appointment_key
    Appointment.find(params[:answer][:appointment_id]).try(&:url_token  )
  end
end