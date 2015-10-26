class Zipcode < ActiveRecord::Base
	self.primary_key = 'zip_code'
	has_many :visitors
end
