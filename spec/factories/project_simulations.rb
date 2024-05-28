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
FactoryBot.define do
  factory :project_simulation do
    title { "MyString" }
    description { "MyText" }
    objectives { "MyText" }
    tools { "MyText" }
    expected_results { "MyText" }
  end
end
