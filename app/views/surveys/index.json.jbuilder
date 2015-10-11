json.array!(@surveys) do |survey|
  json.extract! survey, :id, :person_id, :question_id, :answer
  json.url survey_url(survey, format: :json)
end
