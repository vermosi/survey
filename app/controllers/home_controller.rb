class HomeController < ApplicationController
  def index
    @survey_templates = SurveyTemplate.all
  end
end
