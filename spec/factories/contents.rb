# == Schema Information
#
# Table name: contents
#
#  id          :bigint           not null, primary key
#  description :text
#  level       :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :content do
    title { "MyString" }
    description { "MyText" }
    level { 1 }
  end
end
