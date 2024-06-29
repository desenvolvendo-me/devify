# == Schema Information
#
# Table name: project_simulations
#
#  id               :bigint           not null, primary key
#  complexity       :integer
#  description      :text
#  difficulty       :integer
#  expected_results :text
#  objectives       :text
#  title            :string
#  tools            :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class ProjectSimulation < ApplicationRecord
  has_and_belongs_to_many :users

  enum difficulty: { easy: 0, medium: 1, hard: 2 }, _prefix: :difficulty
  enum complexity: { low: 0, medium: 1, high: 2 }, _prefix: :complexity

  validates :difficulty, presence: true, inclusion: { in: difficulties.keys }
  validates :complexity, presence: true, inclusion: { in: complexities.keys }
end
