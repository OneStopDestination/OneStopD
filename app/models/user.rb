class User < ActiveRecord::Base
  has_many :problems
  has_secure_password
  before_save { |user| user.email = email.downcase }
  validates(:name, :length  => {:maximum => 50} ,:presence => true)
  validates(:constituency , :presence => true)
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:email, :presence => true, :format => {:with => VALID_EMAIL_REGEX}, :uniqueness => {:case_sensitive => false})
  #validates :password, :length => { :minimum => 3 }
  before_save :create_remember_token

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
