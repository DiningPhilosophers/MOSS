require 'rails_helper'

RSpec.describe "zipcodes/edit", type: :view do
  before(:each) do
    @zipcode = assign(:zipcode, Zipcode.create!(
      :zip_code => "MyString",
      :city => "MyString",
      :county => "MyString"
    ))
  end

  it "renders the edit zipcode form" do
    render

    assert_select "form[action=?][method=?]", zipcode_path(@zipcode), "post" do

      assert_select "input#zipcode_zip_code[name=?]", "zipcode[zip_code]"

      assert_select "input#zipcode_city[name=?]", "zipcode[city]"

      assert_select "input#zipcode_county[name=?]", "zipcode[county]"
    end
  end
end
