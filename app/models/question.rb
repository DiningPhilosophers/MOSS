class Question < ActiveRecord::Base
  has_many :surveys
  has_many :groups, through: :surveys
end
