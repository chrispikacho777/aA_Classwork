# require 'bcrypt'
class User < ApplicationRecord
  validates :user_name, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }
  validates :password_digest, presence: true
  validates :session_token, presence: true, uniqueness: true

  attr_reader :password

  # after_initialize :ensure_session_token

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def is_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end

  def self.find_by_credentials(user_name, pw)
    user = User.find_by(user_name: user_name)
    return nil if user.nil?
    user.is_password?(pw) ? user : nil 
  end

end
