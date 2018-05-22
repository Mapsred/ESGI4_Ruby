class GradesController < ApplicationController
  before_action :set_grade, only: %i[show edit update destroy]

  def index
    @grades = Grade.all
  end

  def show; end

  def new
    @grade = Grade.new
  end

  def create
    @grade = Grade.new(
        grade_params
    )
    if @grade.save
      redirect_to @grade
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @grade.update(grade_params)
      redirect_to @grade
    else
      render 'edit'
    end
  end

  def destroy
    @grade.destroy
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