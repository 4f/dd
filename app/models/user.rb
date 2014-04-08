#encoding: UTF-8
class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :admin
  has_secure_password

  before_save :create_remember_token


  validates :name, presence: {message: 'Отсутствует имя'}
  validates :name, length: { maximum: 50, message: 'Длинноватое имя' }
  VALID_EMAIL_REGEX = /\A[\w]+[\w+\-.]*@[a-z\d]+[a-z\d\-.]*\.[a-z]+\z/i

  def admin?
    admin == 1
  end

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end


end