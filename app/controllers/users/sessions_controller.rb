class Users::SessionsController < Users::ApplicationController
  def new
    @form = Users::SessionForm.new(User.new)
  end

  def create
    @form = Users::SessionForm.new(User.new)

    if @form.validate(params[:users_session])
      # ログイン
      render text: 'TODO ログイン'
    else
      render :new
    end
  end

  def destroy

  end
end
