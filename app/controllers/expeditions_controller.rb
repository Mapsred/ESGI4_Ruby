class ExpeditionsController < ApplicationController
  before_action :set_expedition, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new edit update destroy]

# Use callbacks to share common setup or constraints between actions.
  private def set_expedition
    @expedition = Expedition.find(params[:id])
  end

# Never trust parameters from the scary internet, only allow the white list through.
  private def expedition_params
    params.require(:expedition).permit(:astronaut, :planet, :start_date, :end_date)
  end

  def index
    @expeditions = Expedition.all
  end

  def show
  end

  def new
    @expedition = Expedition.new
  end

  def edit
  end

  def create
    @expedition = Expedition.new(expedition_params)

    if @expedition.save
      redirect_to @expedition, notice: 'Expedition was successfully created.'
      render :show, status: :created, location: @expedition
    else
      render :new
    end
  end

  def update
    if @expedition.update(expedition_params)
      redirect_to @expedition, notice: 'Expedition was successfully updated.'
      render :show, status: :ok, location: @expedition
    else
      render :edit
    end
  end

  def destroy
    @expedition.destroy
    redirect_to expeditions_url, notice: 'Expedition was successfully destroyed.'
    head :no_content
  end

end

