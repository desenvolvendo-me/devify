class ProjectSimulationsController < ApplicationController
  # GET /project_simulations
  def index
    @project_simulations = ProjectSimulation.all
  end

  # GET /project_simulations/:id
  def show
    @project_simulation = ProjectSimulation.find(params[:id])
  end

  # GET /project_simulations/:id/new
  def new
    @project_simulation = ProjectSimulation.find(params[:id])
    current_student.project_simulations << @project_simulation
    redirect_to @project_simulation, notice: 'Projeto iniciado com sucesso!'
  end

  private

  def current_student
    # Este método deve ser implementado para retornar o aluno atualmente logado
    # Isso pode ser feito, por exemplo, usando Devise ou um método próprio de autenticação
    Student.first # Exemplo simplificado, substitua com a lógica de autenticação real
  end
end
