class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  validates :name,  presence: true, uniqueness: true
  validates :user, presence: true
  has_many :code_snippets
  has_many :links
  has_secure_password
end
