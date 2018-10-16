class SettingsController < ApplicationController
  def index
    @user = current_user
  end

  def update
    user = current_user
    if user.update_attributes(params.require(:user).permit(:facebook_api_key, :group_id))
      flash[:success] = 'Settings updated'
      redirect_to root_path
    else
      flash[:error] = 'error'
    end
  end
end