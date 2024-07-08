require 'rails_helper'

RSpec.describe Students::StudentProfileService do
  describe '.process_params' do
    let(:params) do
      {
        technologies: ['HTML', 'CSS'],
        technology_other_details: 'JavaScript, Ruby',
        most_studied_language: ['JavaScript'],
        most_studied_language_other_details: 'Python, Java',
        study_duration: 'Other',
        study_duration_details: '6',
        web_framework_study_duration: 'Other',
        web_framework_study_duration_details: '12'
      }
    end

    it 'processes technology_other_details and appends to technologies' do
      processed_params = described_class.process_params(params)
      expect(processed_params[:technologies]).to eq(['HTML', 'CSS', 'JavaScript', 'Ruby'])
    end

    it 'processes most_studied_language_other_details and appends to most_studied_language' do
      processed_params = described_class.process_params(params)
      expect(processed_params[:most_studied_language]).to eq(['JavaScript', 'Python', 'Java'])
    end

    it 'converts study_duration_details to integer when study_duration is Other' do
      processed_params = described_class.process_params(params)
      expect(processed_params[:study_duration_details]).to eq(6)
    end

    it 'sets study_duration_details to 0 when study_duration is Never' do
      params[:study_duration] = 'Never'
      processed_params = described_class.process_params(params)
      expect(processed_params[:study_duration_details]).to eq(0)
    end

    it 'converts web_framework_study_duration_details to integer when web_framework_study_duration is Other' do
      processed_params = described_class.process_params(params)
      expect(processed_params[:web_framework_study_duration_details]).to eq(12)
    end

    it 'sets web_framework_study_duration_details to 0 when web_framework_study_duration is Never' do
      params[:web_framework_study_duration] = 'Never'
      processed_params = described_class.process_params(params)
      expect(processed_params[:web_framework_study_duration_details]).to eq(0)
    end

    it 'does not modify the original params hash' do
      original_params = params.dup
      described_class.process_params(params)
      expect(params).to eq(original_params)
    end
  end
end
