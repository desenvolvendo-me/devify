# == Schema Information
#
# Table name: student_progresses
#
#  id                   :bigint           not null, primary key
#  date                 :date
#  description          :string
#  programming_language :string
#  study_area           :string
#  value                :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class StudentProgress < ApplicationRecord
end
