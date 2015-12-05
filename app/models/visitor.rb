class Visitor < ActiveRecord::Base
  belongs_to :group
  belongs_to :zipcode
  belongs_to :country

  def self.to_csv(options = {}, start_date = '', end_date = '')
  CSV.generate(options) do |csv|
    csv << ["First Name", "Last Name"]
    all.each do |visitor|
      csv << [visitor.first_name, visitor.last_name]
    end
  end
  end
end
