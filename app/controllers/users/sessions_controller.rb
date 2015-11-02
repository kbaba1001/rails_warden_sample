class Users::SessionsController < Users::ApplicationController
  def new
    @form = Users::SessionForm.new
  end

  def create
    @form = Users::SessionForm.new(params[:users_session_form])

    if @form.valid?
      warden.set_user(@form.user, scope: :user)

      redirect_to signed_in_root_path
    else
      render :new
    end
  end

  def destroy
    warden.logout(:user)
    redirect_to root_path
  end
end
