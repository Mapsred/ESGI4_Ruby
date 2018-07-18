# frozen_string_literal: true

# Expedition Controller
class ExpeditionsController < ApplicationController
  before_action :set_expedition, only: %i[show edit update destroy]
  before_action :expedition_in_progress, only: %i[new create]
  before_action :authenticate_user!, only: %i[new edit update destroy]

  def index
    @expeditions = Expedition.all
  end

  def create
    @expedition = Expedition.new(expedition_params)

    if @expedition.save
      flash[:success] = 'Expedition created !'

      redirect_to expedition_path @expedition
    else
      render :new
    end
  end

  def new
    @expedition = Expedition.new
  end

  def edit
    # @expedition fetched from :fetch_expedition
  end

  def show
    # @expedition fetched from :fetch_expedition
  end

  def update
    if @expedition.update(expedition_params)
      flash[:success] = 'Expedition #' + expedition_params[:id] + ' updated !'

      redirect_to expedition_path @expedition
    else
      render :edit
    end
  end

  def destroy
    @expedition.destroy
    flash[:success] = 'Expedition destroyed with success !'

    redirect_to expeditions_url
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expedition
    @expedition = Expedition.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def expedition_params
    params.require(:expedition).permit(:astronaut, :planet_id, :start_date, :end_date, astronaut_ids: [])
  end

  def expedition_in_progress
    expedition = Expedition.last_opened

    return nil unless expedition.present?

    flash[:danger] = 'An expedition is in progress and will end the ' + expedition.end_date.to_s

    redirect_to home_path
  end
end
