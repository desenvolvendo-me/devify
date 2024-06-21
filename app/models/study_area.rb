# == Schema Information
#
# Table name: study_areas
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class StudyArea < ApplicationRecord
  has_many :student_progresses

  validates :name, presence: true
end
