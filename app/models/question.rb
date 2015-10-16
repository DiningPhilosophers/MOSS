class Question < ActiveRecord::Base
  has_many :visitors, through: :surveys
end
