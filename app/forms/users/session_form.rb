module Users
  class SessionForm < Reform::Form
    property :email
    property :password, virtual: true

    validates :email, presence: true
    validates :password, presence: true, length: {within: 6..20, allow_blank: true}

    validate :authenticate

    def authenticate
      unless user = User.find_by(email: email)
        errors.add(:email, 'が見つかりません')
        return
      end

      unless User.token_comparison(user.password_digest, password)
        errors.add(:password, 'が一致しません')
      end
    end
  end
end
