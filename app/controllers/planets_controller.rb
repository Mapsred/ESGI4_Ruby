# frozen_string_literal: true

# Planet Controller
class PlanetsController < ApplicationController
  before_action :fetch_planet, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new edit update destroy]

  def index
    @planets = Planet.all
  end

  def create
    @planet = Planet.new planet_attributes
    if @planet.save
      flash[:success] = 'Planet "' + planet_attributes[:name] + '" created !'

      redirect_to planets_url
    else
      render action: 'new'
    end
  end

  def new
    @planet = Planet.new
  end

  def edit
    # @planet fetched from :fetch_planet
  end

  def show
    # @planet fetched from :fetch_planet
  end

  def update
    if @planet.update_attributes planet_attributes
      flash[:success] = 'Planet #' + planet_attributes[:name] + ' updated !'

      redirect_to planets_url
    else
      render action: :edit
    end
  end

  def destroy
    @planet.destroy

    flash[:success] = 'Planet destroyed with success!'
    redirect_to planets_url
  end

  private

  def planet_attributes
    params.require(:planet).permit(:name, :description, :photo)
  end

  def fetch_planet
    @planet = Planet.find(params[:id])
  end
end
