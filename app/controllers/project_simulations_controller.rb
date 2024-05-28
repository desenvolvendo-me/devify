class ProjectSimulationsController < ApplicationController
  before_action :authenticate_user!
    def index
    @project_simulations = ProjectSimulation.all
  end

  def show
    @project_simulation = ProjectSimulation.find(params[:id])
  end

    def create
      @project_simulation = ProjectSimulation.find(params[:project_id])
      current_user.project_simulations << @project_simulation

      respond_to do |format|
        format.html { redirect_to project_simulations_path, notice: 'Projeto iniciado com sucesso.' }
        format.json { render :show, status: :created, location: @project_simulation }
      end
    end

    private

    def project_simulation_params
      params.require(:project_simulation).permit(:project_id)
    end

end
