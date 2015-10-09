require 'rails_helper'

RSpec.describe "surveys/new", type: :view do
  before(:each) do
    assign(:survey, Survey.new(
      :person_id => 1,
      :question_id => 1,
      :answer => "MyString"
    ))
  end

  it "renders new survey form" do
    render

    assert_select "form[action=?][method=?]", surveys_path, "post" do

      assert_select "input#survey_person_id[name=?]", "survey[person_id]"

      assert_select "input#survey_question_id[name=?]", "survey[question_id]"

      assert_select "input#survey_answer[name=?]", "survey[answer]"
    end
  end
end
