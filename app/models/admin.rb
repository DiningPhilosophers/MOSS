class Admin < ActiveRecord::Base
  attr_accessor :remember_token, :activation_token, :reset_token

  #before_save { self.email = email.downcase }

  # validates user name for presence and length
  validates :user_name, presence: true, length: {maximum: 50}

  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, presence: true, length: {maximum: 255},
  #          format: {with: VALID_EMAIL_REGEX},
  #          uniqueness: {case_sensitive: false}

  # handles password
  has_secure_password
  validates :password, length: {minimum: 6}

  # Returns the hash digest of the given string.
  def Admin.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def Admin.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a admin in the database for use in persistent sessions.
  def remember
    self.remember_token = Admin.new_token
    update_attribute(:remember_digest, Admin.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated_remember?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Forgets a admin.
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = Admin.new_token
    update_attribute(:reset_digest,  Admin.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    AdminMailer.password_reset(self).deliver_now
  end

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end
end