# == Schema Information
#
# Table name: student_profiles
#
#  id                           :bigint           not null, primary key
#  communication_preference     :integer
#  exposure_preference          :integer
#  github                       :text
#  instagram                    :text
#  level_profile                :integer
#  level_profile_survey         :integer
#  linkedin                     :text
#  main_framework               :string
#  main_language                :string
#  most_studied_language        :text             default([]), is an Array
#  study_duration               :string
#  technologies                 :text             default([]), is an Array
#  track                        :string
#  wakatime                     :text
#  web_framework_studied        :text             default([]), is an Array
#  web_framework_study_duration :string
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  user_id                      :bigint           not null
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
    user
    main_language { 'Ruby' }
    main_framework { 'Rails' }
    track { 'FullStack' }
    github { 'https://github.com/student' }
    wakatime { 'https://wakatime.com/@student' }
    linkedin { 'https://linkedin.com/in/student' }
    instagram { 'https://instagram.com/student' }
    technologies { ['HTML', 'CSS', 'JavaScript'] }
    most_studied_language { ['JavaScript'] }
    study_duration { '+ou- 6 meses' }
    study_duration_details { 6 }
    web_framework_studied { ['React'] }
    web_framework_study_duration { '+ou- 6 meses' }
    web_framework_study_duration_details { 6 }
    communication_preference { 7 }
    exposure_preference { 5 }

    after(:create) do |student_profile|
      student_profile.project_simulations << create(:project_simulation)
    end
  end
end
