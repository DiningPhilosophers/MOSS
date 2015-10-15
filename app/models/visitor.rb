class Visitor < ActiveRecord::Base
  belongs_to :group
  belongs_to :country
end