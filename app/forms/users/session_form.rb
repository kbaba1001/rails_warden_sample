module Users
  class SessionForm
    include ActiveModel::Model

    attr_reader :user

    attr_accessor :email
    attr_accessor :password

    validates :email, presence: true
    validates :password, presence: true, length: {within: 6..20, allow_blank: true}

    validate :authenticate

    def initialize(params = {})
      @params = params
      @email = params[:email]
      @password = params[:password]
      @user = User.find_by(email: @email) if @email
    end

    private

    def authenticate
      unless @user
        errors.add(:base, 'ユーザーが見つかりません')
        return
      end

      unless Password.compare(@user.password_digest, password)
        errors.add(:password, 'が一致しません')
      end
    end
  end
end
