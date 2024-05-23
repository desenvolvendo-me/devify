# == Schema Information
#
# Table name: programming_languages
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :programming_language do
    name { FFaker::ProgrammingLanguage.name }
  end
end
