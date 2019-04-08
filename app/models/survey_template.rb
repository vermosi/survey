class SurveyTemplate < ApplicationRecord
    has_many :surveys, dependent: :destroy
    belongs_to :user

    def yes
        #require "pry"; binding.pry
        yes_count = Survey.where({survey_template_id: self.id, answer: "yes"}).count
        total_count = Survey.where({survey_template_id: self.id}).count
        if total_count > 0
            yes_count.to_f / total_count.to_f * 100
        else
            0
        end
    end

    def no
        no_count = Survey.where({survey_template_id: self.id, answer: "no"}).count
        total_count = Survey.where({survey_template_id: self.id}).count
        if total_count > 0
            no_count.to_f / total_count.to_f * 100
        else
            0
        end
    end
end