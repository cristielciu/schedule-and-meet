class WelcomeController < ApplicationController
  def index
    if current_user
      @appointments = current_user.future_appointments
    end
  end
end
