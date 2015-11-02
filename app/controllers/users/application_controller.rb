class Users::ApplicationController < ApplicationController
  helper_method :current_user

  def current_user
    warden.user(:user)
  end

  private

  def authenticate_user!
    unless warden.authenticated?(:user)
      redirect_to new_session_path
    end
  end
end
