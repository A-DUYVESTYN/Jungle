class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, :uniqueness => {:case_sensitive => false}
  validates :password, length: { minimum: 5}


  def self.authenticate_with_credentials(email, password)
    user = User.find_by("LOWER(email)= ?", email.strip.downcase)
    # user = User.find_by_email(email.strip.downcase)
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(password)
      return user
    else
      return nil
    end

  end

end
