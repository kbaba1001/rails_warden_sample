class Users::SessionsController < Users::ApplicationController
  def new
    @form = Users::SessionForm.new
  end

  def create
    @form = Users::SessionForm.new(params[:users_session_form])

    if @form.valid?
      warden.set_user(@form.user)

      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy

  end
end
