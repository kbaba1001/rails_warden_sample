class Password
  class << self
    def hashing(password)
      BCrypt::Password.create(password)
    end

    def conpare(hashed_password, unhashed_password)
      BCrypt::Password.new(hashed_password) == unhashed_password
    end
  end
end
