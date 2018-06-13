class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: %i[new edit update destroy]

  def index
    @reports = Report.all
  end

  def show
  end

  def new
    @report = Report.new
  end

  def edit
  end

  def create
    @report = Report.new(report_params)
    report_params.inspect
    if @report.save
      flash[:success] = 'Rapport "' + report_params[:name] + '" ajouté avec succès !'
      redirect_to reports_url
    else
      render :new
    end
  end

  def update
    if @report.update(report_params)
      flash[:success] = 'Rapport "' + report_params[:name] + '" mis à jour avec succès !'
      redirect_to reports_url
    else
      render :edit
    end
  end

  def destroy
    @report.destroy
      flash[:success] = 'Rapport effacé avec succès !'
      redirect_to reports_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def report_params
    params.require(:report).permit(:name, :description, :astronaut_id)
  end
end
