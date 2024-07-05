class ProjectSimulationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @project_simulations = ProjectSimulation.all
  end

  def show
    @project_simulation = ProjectSimulation.find(params[:id])
  end

  def create
    service = ProjectSimulationService.new(current_user, params[:project_id])
    result = service.create

    if result[:success]
      respond_to do |format|
        format.html { redirect_to project_simulations_path, notice: 'Project started successfully.' }
        format.json { render :show, status: :created, location: result[:project_simulation] }
      end
    else
      redirect_to project_simulations_path, alert: result[:error]
    end
  end

  private

  def project_simulation_params
    params.require(:project_simulation).permit(:project_id)
  end
end
