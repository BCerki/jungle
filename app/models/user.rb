class User < ActiveRecord::Base

  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true
  validates :password, length: {minimum: 3}
  validates :password_confirmation, presence: true

  has_secure_password

  def self.authenticate_with_credentials(email, password)
    clean_email = email.strip.downcase
    user = User.find_by_email(clean_email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
