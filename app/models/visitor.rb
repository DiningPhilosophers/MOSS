class Visitor < ActiveRecord::Base
  belongs_to :group
  belongs_to :zipcode
  belongs_to :country
  has_many :questions, through: :surveys
end