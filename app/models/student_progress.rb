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
class StudentProgress < ApplicationRecord
  belongs_to :programming_language
  belongs_to :study_area

  validates :date, presence: true
  validates :description, presence: true
  validates :value, presence: true
  validates :programming_language, presence: true
  validates :study_area, presence: true
end
