class User < ActiveRecord::Base
  has_many :articles
  before_save {self.email=email.downcase}
  VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :username,presence: true,length: {minimum:4,maximum:40},uniqueness: {case_sensitive: false}
  validates :email,presence: true,length: {minimum:5,maximum:80},uniqueness: true,format: {with: VALID_EMAIL_REGEX}
  has_secure_password
end