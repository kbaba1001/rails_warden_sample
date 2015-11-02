module Admins
  class SessionForm
    include ActiveModel::Model

    attr_reader :admin

    attr_accessor :email
    attr_accessor :password

    validates :email, presence: true
    validates :password, presence: true, length: {within: 6..20, allow_blank: true}

    validate :authenticate

    def initialize(params = {})
      @params = params
      @email = params[:email]
      @password = params[:password]
      @admin = Admin.find_by(email: @email) if @email
    end

    private

    def authenticate
      unless @admin
        errors.add(:base, '管理者が見つかりません')
        return
      end

      unless User.token_comparison(@admin.password_digest, password)
        errors.add(:password, 'が一致しません')
      end
    end
  end
end
