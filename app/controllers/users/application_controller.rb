class Users::ApplicationController < ApplicationController
  private

  def authenticate_user!
    unless authenticated?(:user)
      redirect_to new_session_path
    end
  end
end
