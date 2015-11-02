class Admins::SessionsController < Admins::ApplicationController
  def new
    @form = Admins::SessionForm.new
  end

  def create
    @form = Admins::SessionForm.new(params[:admins_session_form])

    if @form.valid?
      warden.set_user(@form.admin, scope: :admin)

      redirect_to admins_dashboard_path
    else
      render :new
    end
  end

  def destroy

  end
end
