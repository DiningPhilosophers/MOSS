class TexasZipcode < ActiveRecord::Base
  self.table_name = 'texas_zipcodes'
  has_many :visitors
end
