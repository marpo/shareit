class User < ActiveRecord::Base
  attr_accessible :name, :password_digest
  has_secure_password
end
