require 'rails_helper'

RSpec.describe "admins/index", type: :view do
  before(:each) do
    assign(:admins, [
      Admin.create!(
        :user_name => "User Name",
        :password => "Password"
      ),
      Admin.create!(
        :user_name => "User Name",
        :password => "Password"
      )
    ])
  end

  it "renders a list of admins" do
    render
    assert_select "tr>td", :text => "User Name".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
  end
end
