class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence: true, uniqueness: true, length: {in: 4..100 }
	validates :email, presence: true, length: {in: 8..100}, uniqueness: { case_sensitive: false }, confirmation: true, format: { with: EMAIL_REGEX }
	has_secure_password
	validates :password, presence: true, length: { minimum: 8 }
end
