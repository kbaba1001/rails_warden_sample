class Admins::SessionsController < Admins::ApplicationController
  def new
    @form = Admins::SessionForm.new
  end

  def create
    @form = Admins::SessionForm.new(params[:admins_session_form])

    if @form.valid?
      warden.set_user(@form.admin, scope: :admin)

      redirect_to admins_signed_in_root_path
    else
      render :new
    end
  end

  def destroy
    warden.logout(:admin)
    redirect_to admins_root_path
  end
end
