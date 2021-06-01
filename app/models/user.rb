class User < ActiveRecord::Base

  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: true
  validates :password, confirmation: { case_sensitive: false }
  validates :password_confirmation, presence: true

  has_secure_password
end
