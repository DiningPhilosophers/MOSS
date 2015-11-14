class Visitor < ActiveRecord::Base
  belongs_to :group
  belongs_to :zipcode
  belongs_to :country

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |visitor|
        csv << visitor.attributes.values_at(*column_names)
      end
    end
  end
end
