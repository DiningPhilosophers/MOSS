require 'rails_helper'

RSpec.describe "visitors/new", type: :view do
  before(:each) do
    assign(:visitor, Visitor.new(
      :last_name => "MyString",
      :first_name => "MyString",
      :group_id => 1,
      :email => "MyString",
      :contact => false,
      :zip_code => "MyString",
      :country_id => 1
    ))
  end

  it "renders new visitor form" do
    render

    assert_select "form[action=?][method=?]", visitors_path, "post" do

      assert_select "input#visitor_last_name[name=?]", "visitor[last_name]"

      assert_select "input#visitor_first_name[name=?]", "visitor[first_name]"

      assert_select "input#visitor_group_id[name=?]", "visitor[group_id]"

      assert_select "input#visitor_email[name=?]", "visitor[email]"

      assert_select "input#visitor_contact[name=?]", "visitor[contact]"

      assert_select "input#visitor_zip_code[name=?]", "visitor[zip_code]"

      assert_select "input#visitor_country_id[name=?]", "visitor[country_id]"
    end
  end
end
