# == Schema Information
#
# Table name: programming_languages
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ProgrammingLanguage < ApplicationRecord
  has_many :student_progresses

  validates :name, presence: true
end
