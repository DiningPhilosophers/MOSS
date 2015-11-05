class Survey < ActiveRecord::Base
  belongs_to :group
  belongs_to :question
end
