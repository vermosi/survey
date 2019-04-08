class SurveysController < ApplicationController
  before_action :set_survey_template, only: [:new, :show, :create, :edit, :update, :destroy]
  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  def index
    @surveys = Survey.all
  end

  def show

  end

  def new
    @survey = @survey_template.surveys.new
  end

  def edit
  end

  def create
    @survey = current_user.surveys.build(survey_params)
    @survey.survey_template_id = params[:survey_template_id]

    respond_to do |format|
      if @survey.save
        format.html { redirect_to root_url, notice: 'Survey was successfully created.' }
        format.json { redirect_to root_url, status: :created, location: @survey }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to root_url, notice: 'Survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey }
        @survey = Survey.new(answer: params[:answer])
        @survey.save
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_survey
      @survey = Survey.find(params[:id])
    end

    def set_survey_template
      @survey_template = SurveyTemplate.find(params[:survey_template_id])
    end

    def survey_params
      params.require(:survey).permit(:answer)
    end
end
