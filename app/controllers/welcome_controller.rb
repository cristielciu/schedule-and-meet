class WelcomeController < ApplicationController
  skip_before_action :check_logged_in

  def index
    if current_user
      @appointments = current_user.future_appointments
    end
  end
end
