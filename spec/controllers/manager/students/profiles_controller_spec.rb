require 'rails_helper'

RSpec.describe Manager::Students::ProfilesController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:student_profile) { FactoryBot.create(:student_profile, user: user) }

  before do
    sign_in user
    allow(controller).to receive(:current_user).and_return(user)
    allow(user).to receive(:student_profile).and_return(student_profile)
  end

  describe 'GET #show' do
    it 'renders the show template' do
      get :show
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #edit' do
    it 'renders the edit template' do
      get :edit
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    it 'updates the user and student profile' do
      patch :update, params: { user: { name: 'New Name' }, student_profile: { main_language: 'Ruby' } }
      user.reload
      student_profile.reload
      expect(user.name).to eq('New Name')
      expect(student_profile.main_language).to eq('Ruby')
      expect(response).to redirect_to(manager_students_profile_path)
    end
  end

  describe 'POST #submit_evaluation' do
    it 'updates the student profile' do
      post :submit_evaluation, params: { student_profile: { main_language: 'Ruby' } }
      student_profile.reload
      expect(student_profile.main_language).to eq('Ruby')
      expect(response).to redirect_to(manager_students_profile_path)
    end
  end
end
