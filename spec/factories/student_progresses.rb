# == Schema Information
#
# Table name: student_progresses
#
#  id                      :bigint           not null, primary key
#  date                    :date
#  mark                    :string
#  value                   :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  programming_language_id :bigint
#  study_area_id           :bigint
#
# Indexes
#
#  index_student_progresses_on_programming_language_id
#     (programming_language_id)
#  index_student_progresses_on_study_area_id            (study_area_id)
#
# Foreign Keys
#
#  fk_rails_...  (programming_language_id => programming_languages.id)
#  fk_rails_...  (study_area_id => study_areas.id)
#
FactoryBot.define do
  factory :student_progress do
    date { FFaker::Time.date }
    mark { %w[f0 f1 f2 f3 f4].sample }
    value { rand(1..100) }
    association :programming_language
    association :study_area
  end
end
