json.extract! survey, :id, :question, :answer, :created_at, :updated_at
json.url survey_url(survey, format: :json)
