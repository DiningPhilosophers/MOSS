class Group < ActiveRecord::Base
  has_many :visitors
  
  accepts_nested_attributes_for :visitors
end
