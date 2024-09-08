# == Schema Information
#
# Table name: student_profiles
#
#  id                                   :bigint           not null, primary key
#  communication_preference             :integer
#  exposure_preference                  :integer
#  github                               :text
#  instagram                            :text
#  level                                :integer
#  linkedin                             :text
#  main_framework                       :string
#  main_language                        :string
#  most_studied_language                :text             default([]), is an Array
#  most_studied_language_other_details  :text             default([]), is an Array
#  study_duration                       :string
#  study_duration_details               :string
#  technologies                         :text             default([]), is an Array
#  technology_other_details             :text             default([]), is an Array
#  track                                :string
#  wakatime                             :text
#  web_framework_studied                :text             default([]), is an Array
#  web_framework_studied_other_details  :text             default([]), is an Array
#  web_framework_study_duration         :string
#  web_framework_study_duration_details :integer          default(0)
#  created_at                           :datetime         not null
#  updated_at                           :datetime         not null
#  user_id                              :bigint           not null
#
# Indexes
#
#  index_student_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :student_profile do
    association :user
    main_language { "Ruby" }
    main_framework { "Rails" }
    track { "Full Stack" }
    github { "http://github.com/user" }
    wakatime { "http://wakatime.com/user" }
    linkedin { "http://linkedin.com/in/user" }
    instagram { "http://instagram.com/user" }
    technologies { ["Tech1", "Tech2"] }
    most_studied_language { ["Ruby"] }
    study_duration { "+ou- 6 meses" }
    web_framework_studied { ["Rails"] }
    web_framework_study_duration { "+ou- 6 meses" }
    most_studied_language_other_details { ["OtherLang"] }
    web_framework_studied_other_details { ["OtherFramework"] }
    study_duration_details { 6 }
    communication_preference { 5 }
    exposure_preference { 7 }
    technology_other_details { ["OtherTech"] }
    web_framework_study_duration_details { 6 }
  end
end

