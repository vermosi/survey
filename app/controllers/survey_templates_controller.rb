class SurveyTemplatesController < ApplicationController
  before_action :set_survey_template, only: [:show, :edit, :update, :destroy]

  def index
    @survey_templates = SurveyTemplate.all
  end

  def show
  end

  def new
    @survey_template = SurveyTemplate.new
  end

  def edit
  end

  def create
    @survey_template = SurveyTemplate.new(survey_template_params)
    @survey_template.user_id = current_user.id

    respond_to do |format|
      if @survey_template.save
        format.html { redirect_to root_url, notice: 'Survey was successfully created.' }
        format.json { redirect_to root_url, status: :created, location: @survey_template }
      else
        format.html { render :new }
        format.json { render json: @survey_template.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @survey_template.update(survey_template_params)
        format.html { redirect_to root_url, notice: 'Survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey_template }
        @survey_template.save
      else
        format.html { render :edit }
        format.json { render json: @survey_template.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @survey_template.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_survey_template
      @survey_template = SurveyTemplate.find(params[:id])
    end

    def survey_template_params
      params.require(:survey_template).permit(:question)
    end
end
