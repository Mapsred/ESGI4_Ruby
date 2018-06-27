# frozen_string_literal: true

# Planet Controller
class PlanetsController < ApplicationController
  before_action :fetch_planet, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new edit update destroy]

  def fetch_planet
    @planet = Planet.find(params[:id])
  end

  def index
    @planets = Planet.all
  end

  def show
    # @planet fetched from :fetch_planet
  end

  def new
    @planet = Planet.new
  end

  def edit
    # @planet fetched from :fetch_planet
  end

  def update
    if @planet.update_attributes planet_attributes
      flash[:success] = 'Planet #' + params[:id] + ' updated !'

      redirect_to planet_path @planet
    else
      render action: :edit
    end
  end

  def destroy
    @planet.destroy

    flash[:success] = 'Planet #' + params[:id] + ' destroyed !'
  end

  def create
    @planet = Planet.new planet_attributes
    if @planet.save
      flash[:success] = 'Planet "' + report_params[:name] + '" created !'

      redirect_to planets_url
    else
      render action: 'new'
    end
  end

  def planet_attributes
    params.require(:planet).permit(:name, :description)
  end
end
