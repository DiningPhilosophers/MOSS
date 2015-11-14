class Group < ActiveRecord::Base
  has_many :visitors
  accepts_nested_attributes_for :visitors

  has_many :surveys
  has_many :questions, through: :surveys
  accepts_nested_attributes_for :surveys
end
