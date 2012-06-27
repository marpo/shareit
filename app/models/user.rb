class User < ActiveRecord::Base
  attr_accessible :name, :password_digest, :email
  has_secure_password
end
