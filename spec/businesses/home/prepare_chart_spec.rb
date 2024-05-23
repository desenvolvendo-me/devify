require 'rails_helper'

RSpec.describe Home::PrepareChart do
  describe '#call' do
    let!(:programming_language) { create(:programming_language) }
    let!(:study_area) { create(:study_area) }

    context 'with programming_language and study_area present' do
      let!(:student_progress_1) { create(:student_progress, programming_language: programming_language, study_area: study_area, date: Date.new(2023, 1, 1), value: 5) }
      let!(:student_progress_2) { create(:student_progress, programming_language: programming_language, study_area: study_area, date: Date.new(2023, 1, 8), value: 10) }

      it 'returns the progress data grouped by week' do
        result = described_class.new(programming_language.id, study_area.id).call
        expect(result).to eq({ "25/Dez/2022" => 5, "01/Jan/2023" => 10 })
      end
    end

    context 'with only programming_language present' do
      let!(:student_progress) { create(:student_progress, programming_language: programming_language, study_area: study_area, date: Date.new(2023, 1, 1), value: 5) }

      it 'returns the progress data grouped by week for the specific programming_language' do
        result = described_class.new(programming_language.id, nil).call
        expect(result).to eq({ "25/Dez/2022" => 5 })
      end
    end

    context 'with only study_area present' do
      let!(:student_progress) { create(:student_progress, programming_language: programming_language, study_area: study_area, date: Date.new(2023, 1, 1), value: 5) }

      it 'returns the progress data grouped by week for the specific study_area' do
        result = described_class.new(nil, study_area.id).call
        expect(result).to eq({ "25/Dez/2022" => 5 })
      end
    end

    context 'with no programming_language or study_area present' do
      let!(:student_progress) { create(:student_progress, programming_language: programming_language, study_area: study_area, date: Date.new(2023, 1, 1), value: 5) }

      it 'returns the progress data grouped by week for all data' do
        result = described_class.new(nil, nil).call
        expect(result).to eq({ "25/Dez/2022" => 5 })
      end
    end
  end
end
