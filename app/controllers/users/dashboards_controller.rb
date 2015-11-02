class Users::DashboardsController < Users::ApplicationController
  before_action :authenticate_user!

  def show
  end
end
