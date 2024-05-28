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
require 'rails_helper'

RSpec.describe ProjectSimulation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
