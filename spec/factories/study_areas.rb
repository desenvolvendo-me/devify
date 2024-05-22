# == Schema Information
#
# Table name: study_areas
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :study_area do
    name { "MyString" }
  end
end
