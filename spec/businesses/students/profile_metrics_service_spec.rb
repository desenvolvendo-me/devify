require 'rails_helper'

RSpec.describe Students::ProfileMetricsService, type: :service do
  let(:student_profile) { create(:student_profile) }
  let(:service) { described_class.new(student_profile) }

  describe '#calculate_profile_level' do
    context 'when there are no project simulations' do
      it 'returns level 1' do
        expect(service.calculate_profile_level).to eq(1)
      end
    end

    context 'when total points are between 0 and 5' do
      it 'returns level 1' do
        create(:project_simulation, difficulty: 'easy', complexity: 'low', student_profiles: [student_profile])
        expect(service.calculate_profile_level).to eq(1)
      end
    end

    context 'when total points are between 6 and 10' do
      it 'returns level 2' do
        create(:project_simulation, difficulty: 'easy', complexity: 'medium', student_profiles: [student_profile])
        create(:project_simulation, difficulty: 'easy', complexity: 'medium', student_profiles: [student_profile])
        expect(service.calculate_profile_level).to eq(2)
      end
    end

    context 'when total points are between 11 and 15' do
      it 'returns level 3' do
        create(:project_simulation, difficulty: 'medium', complexity: 'medium', student_profiles: [student_profile])
        create(:project_simulation, difficulty: 'easy', complexity: 'medium', student_profiles: [student_profile])
        create(:project_simulation, difficulty: 'easy', complexity: 'low', student_profiles: [student_profile])
        expect(service.calculate_profile_level).to eq(3)
      end
    end

    context 'when total points are above 55' do
      it 'returns level 12' do
        19.times { create(:project_simulation, difficulty: 'hard', complexity: 'high', student_profiles: [student_profile]) }
        expect(service.calculate_profile_level).to eq(12)
      end
    end
  end
end
