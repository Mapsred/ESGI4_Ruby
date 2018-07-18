# frozen_string_literal: true

# Astronaut Controller
class AstronautsController < ApplicationController
  before_action :fetch_astronaut, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new edit update destroy]

  def index
    @astronauts = Astronaut.includes(:grade, :planet)
  end

  def create
    @astronaut = Astronaut.new astronaut_parameters
    if @astronaut.save
      flash[:success] = 'Astronaut "' + astronaut_parameters[:name] + '" created !'

      redirect_to astronauts_url
    else
      render action: 'new'
    end
  end

  def new
    @astronaut = Astronaut.new
  end

  def show
    # @astronaut fetched from :fetch_astronaut
  end

  def update
    if @astronaut.update_attributes astronaut_parameters
      flash[:success] = 'Astronaut #' + astronaut_parameters[:name] + ' updated !'

      redirect_to astronauts_url
    else
      render action: :edit
    end
  end

  def edit
    # @astronaut fetched from :fetch_astronaut
  end

  def destroy
    @astronaut.destroy

    flash[:success] = 'Astronaut destroyed with success !'
    redirect_to astronauts_url
  end

  private

  def fetch_astronaut
    @astronaut = Astronaut.find(params[:id])
  end

  def astronaut_parameters
    params.require(:astronaut).permit(:name, :mail, :grade_id, :planet_id)
  end

end
