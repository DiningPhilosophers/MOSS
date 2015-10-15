class Survey < ActiveRecord::Base
  belongs_to :visitor
  belongs_to :question
end
