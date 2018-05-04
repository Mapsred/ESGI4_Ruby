# frozen_string_literal: true

# Planet Controller
class PlanetsController < ApplicationController
  def index
    @planets = Planet.all
  end

  def show
    @planet = Planet.find(params[:id])
  end

  def new
    @planet = Planet.new
  end

  def create
    @planet = Planet.new(params.require(:planet).permit(:name, :description))
    if @planet.save
      redirect_to planets_url
    else
      render action: 'new'
    end
  end

end
