require 'rails_helper'

RSpec.describe "surveys/index", type: :view do
  before(:each) do
    assign(:surveys, [
      Survey.create!(
        :person_id => 1,
        :question_id => 2,
        :answer => "Answer"
      ),
      Survey.create!(
        :person_id => 1,
        :question_id => 2,
        :answer => "Answer"
      )
    ])
  end

  it "renders a list of surveys" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Answer".to_s, :count => 2
  end
end
