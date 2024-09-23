class ProjectSimulationsController < ApplicationController
  before_action :authenticate_user!

  def index
   student_profile = current_user.student_profile

   profile_metrics_service = ::Students::ProfileMetricsService.new(@student_profile)
   @profile_level = profile_metrics_service.calculate_profile_level

   @project_simulations = case @profile_level
       when 1
         ProjectSimulation.Easy
       when 2
         ProjectSimulation.Medium.or(ProjectSimulation.Easy) 
       when 3
         ProjectSimulation.all 
       else
         ProjectSimulation.none 
       end
  end

  def show
    @project_simulation = ProjectSimulation.find(params[:id])
  end

  def create
    service = ProjectSimulationService.new(current_user, params[:project_id])
    result = service.create

    if result[:success]
      respond_to do |format|
        format.html { redirect_to project_simulations_path, notice: 'Projeto iniciado com sucesso.' }
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
