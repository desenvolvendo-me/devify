# == Schema Information
#
# Table name: student_progresses
#
#  id                   :bigint           not null, primary key
#  date                 :date
#  description          :string
#  programming_language :string
#  study_area           :string
#  value                :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
FactoryBot.define do
  factory :student_progress do
    date { "2024-05-22" }
    description { "MyString" }
    programming_language { "MyString" }
    study_area { "MyString" }
    value { 1 }
  end
end
