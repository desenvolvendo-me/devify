require 'rails_helper'

RSpec.describe Manager::HomeController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  before(:each) do
    allow_any_instance_of(InternalController)
      .to receive(:authenticate_user!).and_return(true)
    allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(user)
  end

  describe 'GET #index' do
    let!(:programming_language) { create(:programming_language) }
    let!(:study_area) { create(:study_area) }
    let!(:student_progress) { create(:student_progress, programming_language: programming_language, study_area: study_area) }

    before do
      allow(Home::PrepareChart).to receive(:new).and_return(double(call: { "2023-01-01" => 10 }))
      get :index, params: { language: programming_language.id, area: study_area.id }
    end

    it 'assigns @languages' do
      expect(assigns(:languages)).to eq([programming_language])
    end

    it 'assigns @areas' do
      expect(assigns(:areas)).to eq([study_area])
    end

    it 'calls Home::PrepareChart with correct parameters' do
      expect(Home::PrepareChart).to have_received(:new).with(programming_language.id.to_s, study_area.id.to_s)
    end

    it 'assigns @student_progress_data' do
      expect(assigns(:student_progress_data)).to eq({ "2023-01-01" => 10 })
    end
  end
end
