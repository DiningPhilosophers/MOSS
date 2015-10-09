require 'rails_helper'

RSpec.describe "zipcodes/new", type: :view do
  before(:each) do
    assign(:zipcode, Zipcode.new(
      :zip_code => "MyString",
      :city => "MyString",
      :county => "MyString"
    ))
  end

  it "renders new zipcode form" do
    render

    assert_select "form[action=?][method=?]", zipcodes_path, "post" do

      assert_select "input#zipcode_zip_code[name=?]", "zipcode[zip_code]"

      assert_select "input#zipcode_city[name=?]", "zipcode[city]"

      assert_select "input#zipcode_county[name=?]", "zipcode[county]"
    end
  end
end
