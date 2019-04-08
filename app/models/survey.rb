class Survey < ApplicationRecord
    belongs_to :survey_template
    belongs_to :user
    delegate :question, to: :survey_template, allow_nil: false
end
