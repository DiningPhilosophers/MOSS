class Answer < ActiveRecord::Base
  self.table_name = 'answers'
  # has_many :visitors
  belongs_to :questions
end
