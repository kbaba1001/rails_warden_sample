class User < ActiveRecord::Base
  validates_presence_of :email, :password_digest
end
