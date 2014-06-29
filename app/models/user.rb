class User < ActiveRecord::Base

	validates :first_name,  presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, 	presence: 	true, 
						format: 	{ with: VALID_EMAIL_REGEX }, 
						uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6 }, on: :create
	has_secure_password
end
