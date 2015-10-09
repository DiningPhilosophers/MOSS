require 'rails_helper'

RSpec.describe "visitors/show", type: :view do
  before(:each) do
    @visitor = assign(:visitor, Visitor.create!(
      :last_name => "Last Name",
      :first_name => "First Name",
      :group_id => 1,
      :email => "Email",
      :contact => false,
      :zip_code => "Zip Code",
      :country_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Zip Code/)
    expect(rendered).to match(/2/)
  end
end
