# == Schema Information
#
# Table name: project_simulations
#
#  id               :bigint           not null, primary key
#  description      :text
#  expected_results :text
#  objectives       :text
#  title            :string
#  tools            :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class ProjectSimulation < ApplicationRecord
  has_and_belongs_to_many :users
end
