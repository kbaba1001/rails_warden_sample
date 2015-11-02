class User < ActiveRecord::Base
  validates_presence_of :email, :password_digest

  # TODO どこかにロジックを移動する
  class << self
    def hashing(password)
      BCrypt::Password.create(password)
    end

    def token_comparison(hashed_password, unhashed_password)
      BCrypt::Password.new(hashed_password) == unhashed_password
    end
  end
end
