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
FactoryBot.define do
  factory :project_simulation do
    title { FFaker::Lorem.sentence }
    description { FFaker::Lorem.paragraph }
    objectives { FFaker::Lorem.paragraph }
    tools { FFaker::Lorem.paragraph }
    expected_results { FFaker::Lorem.paragraph }
    difficulty { 'easy' }
    complexity { 'low' }
  end
end
