class Admins::ApplicationController < ApplicationController
  helper_method :current_admin

  def current_admin
    user(scope: :admin)
  end

  private

  def authenticate_admin!
    unless authenticated?(scope: :admin)
      redirect_to new_admins_session_path
    end
  end
end
