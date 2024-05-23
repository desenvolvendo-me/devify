# == Schema Information
#
# Table name: student_progresses
#
#  id                      :bigint           not null, primary key
#  date                    :date
#  description             :string
#  value                   :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  programming_language_id :bigint
#  study_area_id           :bigint
#
# Indexes
#
#  index_student_progresses_on_programming_language_id  (programming_language_id)
#  index_student_progresses_on_study_area_id            (study_area_id)
#
# Foreign Keys
#
#  fk_rails_...  (programming_language_id => programming_languages.id)
#  fk_rails_...  (study_area_id => study_areas.id)
#
require 'rails_helper'

RSpec.describe StudentProgress, type: :model do
  it "is valid with a valid date, description, value, programming_language, and study_area" do
    student_progress = build(:student_progress)
    expect(student_progress).to be_valid
  end

  it "is invalid without a date" do
    student_progress = build(:student_progress, date: nil)
    student_progress.valid?
    expect(student_progress.errors[:date]).to include("não pode ficar em branco")
  end

  it "is invalid without a description" do
    student_progress = build(:student_progress, description: nil)
    student_progress.valid?
    expect(student_progress.errors[:description]).to include("não pode ficar em branco")
  end

  it "is invalid without a value" do
    student_progress = build(:student_progress, value: nil)
    student_progress.valid?
    expect(student_progress.errors[:value]).to include("não pode ficar em branco")
  end

  it "is invalid without a programming_language" do
    student_progress = build(:student_progress, programming_language: nil)
    student_progress.valid?
    expect(student_progress.errors[:programming_language]).to include("não pode ficar em branco")
  end

  it "is invalid without a study_area" do
    student_progress = build(:student_progress, study_area: nil)
    student_progress.valid?
    expect(student_progress.errors[:study_area]).to include("não pode ficar em branco")
  end
end
