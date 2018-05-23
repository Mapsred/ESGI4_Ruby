# frozen_string_literal: true

# Astronaut Controller
class AstronautsController < ApplicationController
  before_action :fetch_astronaut, only: %i[show edit update destroy]

  def fetch_astronaut
    @astronaut = Astronaut.find(params[:id])
  end

  def astronaut_parameters
    params.require(:astronaut).permit(:name, :mail, :grade_id, :planet_id)
  end

  def index
    @astronauts = Astronaut.all
  end

  def new
    @astronaut = Astronaut.new
  end

  def create
    @astronaut = Astronaut.new astronaut_parameters
    if @astronaut.save
      redirect_to astronauts_url
    else
      render action: 'new'
    end
  end

  def show;
  end

  def edit;
  end

  def update
    if @astronaut.update_attributes astronaut_parameters
      flash[:success] = 'Astronaut #' + params[:id] + ' updated !'

      redirect_to astronaut_path @astronaut
    else
      render action: :edit
    end
  end

  def destroy
    @astronaut.destroy

    flash[:success] = 'Astronaut #' + params[:id] + ' destroyed !'
  end
end
