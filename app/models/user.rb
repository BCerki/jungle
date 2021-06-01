class User < ActiveRecord::Base

  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: true
  validates :password, confirmation: { case_sensitive: false }
  validates :password, length: {minimum: 3}
  validates :password_confirmation, presence: true

  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
