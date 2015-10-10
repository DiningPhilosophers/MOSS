require 'rails_helper'

RSpec.describe "surveys/edit", type: :view do
  before(:each) do
    @survey = assign(:survey, Survey.create!(
      :person_id => 1,
      :question_id => 1,
      :answer => "MyString"
    ))
  end

  it "renders the edit survey form" do
    render

    assert_select "form[action=?][method=?]", survey_path(@survey), "post" do

      assert_select "input#survey_person_id[name=?]", "survey[person_id]"

      assert_select "input#survey_question_id[name=?]", "survey[question_id]"

      assert_select "input#survey_answer[name=?]", "survey[answer]"
    end
  end
end
