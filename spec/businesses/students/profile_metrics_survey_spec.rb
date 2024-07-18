require 'rails_helper'

RSpec.describe Students::ProfileMetricsSurvey do
  let(:student_profile) { FactoryBot.create(:student_profile) }
  let(:service) { described_class.new(student_profile) }

  describe '#skills' do
    it 'calculates the correct skills score' do
      student_profile.technologies = ['Tech1', 'Tech2']
      student_profile.web_framework_studied = ['Framework1']
      student_profile.technology_other_details = ['Other1', 'Other2']
      expect(service.skills).to eq(5)
    end
  end

  describe '#language_mastery' do
    it 'calculates the correct language mastery score' do
      student_profile.study_duration = '+ou- 6 meses'
      student_profile.web_framework_study_duration = 'Outro'
      student_profile.web_framework_study_duration_details = 8
      expect(service.language_mastery).to eq(14)
    end
  end

  describe '#exposure' do
    it 'calculates the correct exposure score' do
      student_profile.communication_preference = 6
      student_profile.exposure_preference = 8
      expect(service.exposure).to eq(7)
    end
  end
end
