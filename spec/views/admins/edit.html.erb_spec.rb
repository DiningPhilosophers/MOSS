require 'rails_helper'

RSpec.describe "admins/edit", type: :view do
  before(:each) do
    @admin = assign(:admin, Admin.create!(
      :user_name => "MyString",
      :password => "MyString"
    ))
  end

  it "renders the edit admin form" do
    render

    assert_select "form[action=?][method=?]", admin_path(@admin), "post" do

      assert_select "input#admin_user_name[name=?]", "admin[user_name]"

      assert_select "input#admin_password[name=?]", "admin[password]"
    end
  end
end
