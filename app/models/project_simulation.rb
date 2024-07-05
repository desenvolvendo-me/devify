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
class ProjectSimulation < ApplicationRecord
  has_and_belongs_to_many :users

  enum difficulty: {
    easy: "Facil",
    medium: "Medio",
    hard: "Dificil"
  }, _suffix: true

  enum complexity: {
    low: "Baixa",
    medium: "Media",
    high: "Alta"
  }, _suffix: true

  validates :difficulty, presence: true, inclusion: { in: difficulties.keys }
  validates :complexity, presence: true, inclusion: { in: complexities.keys }
end
