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

  DIFFICULTIES = %w[easy medium hard].freeze
  COMPLEXITIES = %w[low medium high].freeze

  validates :difficulty, presence: true, inclusion: { in: DIFFICULTIES }
  validates :complexity, presence: true, inclusion: { in: COMPLEXITIES }
end
