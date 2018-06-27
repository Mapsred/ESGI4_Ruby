# frozen_string_literal: true

#ExpeditionController
class ExpeditionsController < ApplicationController
  before_action :set_expedition, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new edit update destroy]
  before_action :expedition_in_progress, only: %i[new create]

  # Use callbacks to share common setup or constraints between actions.
  private def set_expedition
    @expedition = Expedition.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  private def expedition_params
    params.require(:expedition).permit(:astronaut, :planet_id, :start_date, :end_date, astronaut_ids: [])
  end

  private def expedition_in_progress
    expedition = Expedition.last_opened

    return nil unless expedition.any?

    flash[:danger] = 'Une expédition est en cours et se finira le ' + expedition.end_date.to_s

    redirect_to home_path
  end

  def index
    @expeditions = Expedition.all
  end

  def show
    # @expedition fetched from :fetch_expedition
  end

  def new
    @expedition = Expedition.new
  end

  def edit
    # @expedition fetched from :fetch_expedition
  end

  def create
    @expedition = Expedition.new(expedition_params)

    if @expedition.save
      flash[:success] = 'Expedition "' + report_params[:id] + '" created !'

      redirect_to expedition_path @expedition
    else
      render :new
    end
  end

  def update
    if @expedition.update(expedition_params)
      flash[:success] = 'Expedition #' + params[:id] + ' updated !'

      redirect_to expedition_path @expedition
    else
      render :edit
    end
  end

  def destroy
    @expedition.destroy
    flash[:success] = 'Expedition "' + report_params[:id] + '" destroyed !'

    redirect_to expeditions_url
    head :no_content
  end
end
