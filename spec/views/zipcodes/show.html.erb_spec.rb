require 'rails_helper'

RSpec.describe "zipcodes/show", type: :view do
  before(:each) do
    @zipcode = assign(:zipcode, Zipcode.create!(
      :zip_code => "Zip Code",
      :city => "City",
      :county => "County"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Zip Code/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/County/)
  end
end
