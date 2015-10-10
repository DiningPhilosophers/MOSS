require 'rails_helper'

RSpec.describe "visitors/index", type: :view do
  before(:each) do
    assign(:visitors, [
      Visitor.create!(
        :last_name => "Last Name",
        :first_name => "First Name",
        :group_id => 1,
        :email => "Email",
        :contact => false,
        :zip_code => "Zip Code",
        :country_id => 2
      ),
      Visitor.create!(
        :last_name => "Last Name",
        :first_name => "First Name",
        :group_id => 1,
        :email => "Email",
        :contact => false,
        :zip_code => "Zip Code",
        :country_id => 2
      )
    ])
  end

  it "renders a list of visitors" do
    render
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Zip Code".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
