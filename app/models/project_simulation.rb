# == Schema Information
#
# Table name: project_simulations
#
#  id               :bigint           not null, primary key
#  complexity       :string
#  description      :text
#  difficulty       :string
#  expected_results :text
#  objectives       :text
#  title            :string
#  tools            :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# app/models/project_simulation.rb

class ProjectSimulation < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :student_profiles

  DIFFICULTIES = [
    :easy,
    :medium,
    :hard
  ]

  COMPLEXITIES = [
    :low,
    :medium,
    :high
  ]

  enum difficulty: DIFFICULTIES, _suffix: true
  enum complexity: COMPLEXITIES, _suffix: true

  validates :difficulty, presence: true, inclusion: { in: difficulties.keys }
  validates :complexity, presence: true, inclusion: { in: complexities.keys }
end

