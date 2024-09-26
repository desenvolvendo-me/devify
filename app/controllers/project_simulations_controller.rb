class ProjectSimulationsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin?
      @project_simulations = ProjectSimulation.all
    else
      # Encontra os projetos associados ao usuário atual ou aos projetos criados por administradores
      @project_simulations = ProjectSimulation.joins(:users).where(users: { id: current_user.id })
      admin_ids = User.where(admin: true).pluck(:id)
      @project_simulations = @project_simulations.or(ProjectSimulation.joins(:users).where(users: { id: admin_ids })).distinct
    end
  end

  def show
    @project_simulation = ProjectSimulation.find(params[:id])
  end

  def start
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

  def create
    @project_simulation = ProjectSimulation.new(project_simulation_params)

    if @project_simulation.save
      # Adiciona o usuário atual à lista de usuários associados ao projeto
      @project_simulation.users << current_user
      redirect_to project_simulations_path, notice: 'Projeto criado com sucesso.'
    else
      render :new
    end
  end
  def new
    @project_simulation = ProjectSimulation.new
  end

  private

  private

  def project_simulation_params
    params.require(:project_simulation).permit(:title, :description, :objectives, :tools, :expected_results, :difficulty, :complexity)
  end

end
