class GradesController < ApplicationController
  before_action :set_grade, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new edit update destroy]

  def index
    @grades = Grade.all
  end

  def create
    @grade = Grade.new grade_params
    if @grade.save
      flash[:success] = 'Grade "' + report_params[:name] + '" created !'

      redirect_to @grade
    else
      render 'new'
    end
  end

  def new
    @grade = Grade.new
  end

  def edit
    # @grade fetched from :set_grade
  end

  def show
    # @grade fetched from :set_grade
  end

  def update
    if @grade.update(grade_params)
      flash[:success] = 'Grade "' + report_params[:id] + '" updated !'

      redirect_to @grade
    else
      render 'edit'
    end
  end

  def destroy
    @grade.destroy

    flash[:success] = 'Grade "' + report_params[:id] + '" destroyed !'

    redirect_to grades_url
  end

  private

  def grade_params
    params.require(:grade).permit(:name, :alias, :description)
  end

  def set_grade
    @grade = Grade.find(params[:id])
  end
end