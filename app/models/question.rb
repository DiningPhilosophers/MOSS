class Question < ActiveRecord::Base
  has_many :surveys
  has_many :groups, through: :surveys

  has_many :answers
  accepts_nested_attributes_for :answers
end
