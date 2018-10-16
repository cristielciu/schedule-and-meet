class ApplicationController < ActionController::Base
  before_action :check_logged_in

  def check_logged_in
    unless current_user
      redirect_to root_path
    end
  end
end
