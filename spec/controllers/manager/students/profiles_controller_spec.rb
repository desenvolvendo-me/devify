require 'rails_helper'

RSpec.describe Manager::Students::ProfilesController, type: :controller do
  let(:user) { create(:user) }
  let(:student_profile) { create(:student_profile, user: user) }

  before do
    sign_in user
    allow(controller).to receive(:current_user).and_return(user)
    allow(user).to receive(:student_profile).and_return(student_profile)
  end

  describe 'GET #show' do
    context 'when profile is complete' do
      before do
        student_profile.update(main_language: 'Ruby', track: 'Back-End')
        get :show
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the show template' do
        expect(response).to render_template(:show)
      end
    end

    context 'when profile is incomplete' do
      before do
        student_profile.update(main_language: '', track: '')
        get :show
      end

      it 'redirects to edit page with notice' do
        expect(response).to redirect_to(edit_manager_students_profile_path)
        expect(flash[:notice]).to eq('Please complete your profile.')
      end
    end
  end

  describe 'GET #edit' do
    before { get :edit }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the edit template' do
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      before do
        patch :update, params: { user: { name: 'Updated Name' }, student_profile: { main_language: 'Python', track: 'FullStack' } }
      end

      it 'updates the user and profile' do
        user.reload
        student_profile.reload
        expect(user.name).to eq('Updated Name')
        expect(student_profile.main_language).to eq('Python')
        expect(student_profile.track).to eq('FullStack')
      end

      it 'redirects to profile show page with notice' do
        expect(response).to redirect_to(manager_students_profile_path)
        expect(flash[:notice]).to eq('Profile was successfully updated.')
      end
    end

    context 'with invalid attributes' do
      before do
        allow_any_instance_of(StudentProfile).to receive(:update).and_return(false)
        patch :update, params: { user: { name: 'Updated Name' }, student_profile: { main_language: '', track: '' } }
      end

      it 'renders the edit template' do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'GET #evaluate' do
    before { get :evaluate }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the evaluate template' do
      expect(response).to render_template(:evaluate)
    end
  end

  describe 'POST #submit_evaluation' do
    context 'with valid attributes' do
      before do
        post :submit_evaluation, params: { student_profile: { main_language: 'JavaScript', track: 'FullStack', communication_preference: 7, exposure_preference: 5 } }
      end

      it 'updates the profile' do
        student_profile.reload
        expect(student_profile.main_language).to eq('JavaScript')
        expect(student_profile.track).to eq('FullStack')
        expect(student_profile.communication_preference).to eq(7)
        expect(student_profile.exposure_preference).to eq(5)
      end

      it 'redirects to profile show page with notice' do
        expect(response).to redirect_to(manager_students_profile_path)
        expect(flash[:notice]).to eq('Evaluation was successfully submitted.')
      end
    end

    context 'with invalid attributes' do
      before do
        allow_any_instance_of(StudentProfile).to receive(:update).and_return(false)
        post :submit_evaluation, params: { student_profile: { main_language: '', track: '' } }
      end

      it 'renders the evaluate template' do
        expect(response).to render_template(:evaluate)
      end
    end
  end
end
