class Users::ApplicationController < ApplicationController
  private

  def authenticate_user!
    unless authenticated?
      redirect_to new_session_path
    end
  end
end
