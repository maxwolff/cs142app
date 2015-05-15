class User < ActiveRecord::Base
	has_many :photos
	has_many :comments
	def password_valid? (password)
		saltedPassword = password + self.salt.to_s
		shaPassword = Digest::SHA1.hexdigest(saltedPassword)
		return shaPassword == self.password
	end
	def password 
		self.digest
	end 
	def password= (password)
		salt = rand(0..1000000000000)
		self.update_attribute(:salt, salt) 
		self.update_attribute(:digest, Digest::SHA1.hexdigest(password + salt.to_s))
	end
end

