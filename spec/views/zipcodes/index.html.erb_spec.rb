require 'rails_helper'

RSpec.describe "zipcodes/index", type: :view do
  before(:each) do
    assign(:zipcodes, [
      Zipcode.create!(
        :zip_code => "Zip Code",
        :city => "City",
        :county => "County"
      ),
      Zipcode.create!(
        :zip_code => "Zip Code",
        :city => "City",
        :county => "County"
      )
    ])
  end

  it "renders a list of zipcodes" do
    render
    assert_select "tr>td", :text => "Zip Code".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "County".to_s, :count => 2
  end
end
