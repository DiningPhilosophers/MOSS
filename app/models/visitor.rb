class Visitor < ActiveRecord::Base
  belongs_to :group
  belongs_to :zipcode
  belongs_to :country
  has_many :questions, through: :surveys

  # Access needed for the testing purposes.
  attr_accessible :created_at
end