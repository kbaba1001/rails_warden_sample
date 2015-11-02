module Auth
  class PasswordStrategy < ::Warden::Strategies::Base
    def valid?
      !!(params[:id] && param[:password])
    end

    def authenticate!
      # TODO ここでscopeを取得できるので利用する
      user = User.find_by(id: params[:id])
      auth = authentication_service.new(user, params[:password])
      auth.authenticated? ? success!(user) : fail!('Could not log in')
    end
  end
end

Warden::Strategies.add(:password_strategy, Auth::PasswordStrategy)
