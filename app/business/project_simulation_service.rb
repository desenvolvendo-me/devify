# app/business/project_simulation_service.rb
class ProjectSimulationService
  def initialize(user, project_id)
    @user = user
    @project_simulation = ProjectSimulation.find(project_id)
  end

  def create
    @user.project_simulations << @project_simulation
    { success: true, project_simulation: @project_simulation }
  rescue ActiveRecord::RecordNotUnique => e
    if e.message.include?("index_user_project_simulation_on_user_and_project")
      { success: false, error: 'Você já iniciou este projeto.' }
    else
      { success: false, error: 'Erro ao iniciar o projeto.' }
    end
  end
end
