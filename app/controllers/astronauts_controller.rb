# frozen_string_literal: true

# Astronaut Controller
class AstronautsController < ApplicationController
  before_action :fetch_astronaut, only: %i[show edit update destroy]

  def index
    @astronauts = Astronaut.all
  end

  def show
    # @astronaut fetched from :fetch_astronaut
  end

  def new
    @astronaut = Astronaut.new
  end

  def edit
    # @astronaut fetched from :fetch_astronaut
  end

  def update
    if @astronaut.update_attributes params.require(:astronaut).permit(:name, :description)
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

  def create
    @astronaut = Astronaut.new(params.require(:astronaut).permit(:name, :description))
    if @astronaut.save
      redirect_to astronauts_url
    else
      render action: 'new'
    end
  end

  def fetch_astronaut
    @astronaut = Astronaut.find(params[:id])
  end
end
