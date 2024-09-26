require 'rails_helper'

RSpec.describe ProjectSimulationsController, type: :controller do
  let(:user) { create(:user) }
  let(:project_simulation) { create(:project_simulation) }
  let(:valid_attributes) {
    { title: 'Test Project', description: 'Test description', difficulty: 'Fácil', complexity: 'Baixa' }
  }
  let(:invalid_attributes) {
    { title: '', description: '', difficulty: 'Invalid', complexity: '' }
  }
  let(:valid_session) { { user_id: user.id } }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns a success response" do
      # Associa o project_simulation ao usuário antes de chamar a ação
      user.project_simulations << project_simulation

      get :index, params: {}, session: valid_session
      expect(response).to be_successful
      expect(assigns(:project_simulations)).to eq([project_simulation])
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: project_simulation.to_param }, session: valid_session
      expect(response).to be_successful
      expect(assigns(:project_simulation)).to eq(project_simulation)
    end
  end

  describe "POST #start" do
    context "when the project is not already started" do
      it "creates a new project_simulations_user record" do
        expect {
          post :start, params: { project_id: project_simulation.id }, session: valid_session
        }.to change(user.project_simulations, :count).by(1)
      end

      it "redirects to the project_simulations list with a notice" do
        post :start, params: { project_id: project_simulation.id }, session: valid_session
        expect(response).to redirect_to(project_simulations_path)
        expect(flash[:notice]).to eq('Projeto iniciado com sucesso.')
      end
    end

    context "when the project is already started" do
      before do
        user.project_simulations << project_simulation
      end

      it "does not create a new project_simulations_user record" do
        expect {
          post :start, params: { project_id: project_simulation.id }, session: valid_session
        }.not_to change(user.project_simulations, :count)
      end

      it "redirects to the project_simulations list with an alert" do
        post :start, params: { project_id: project_simulation.id }, session: valid_session
        expect(response).to redirect_to(project_simulations_path)
        expect(flash[:alert]).to eq('Você já iniciou este projeto.')
      end
    end
  end
  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new ProjectSimulation" do
        expect {
          post :create, params: { project_simulation: valid_attributes }, session: valid_session
        }.to change(ProjectSimulation, :count).by(1)
      end

      it "redirects to the project_simulations list with a success notice" do
        post :create, params: { project_simulation: valid_attributes }, session: valid_session
        expect(response).to redirect_to(project_simulations_path)
        expect(flash[:notice]).to eq('Projeto criado com sucesso.')
      end
    end

    context "with invalid parameters" do
      it "re-renders the 'new' template" do
        post :create, params: { project_simulation: invalid_attributes }, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end
end
