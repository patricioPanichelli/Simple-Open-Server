require 'securerandom'
class Download < ActiveRecord::Base
	def buildLink
		self.link = SecureRandom.hex
		self
	end
end
