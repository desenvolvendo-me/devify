# == Schema Information
#
# Table name: student_profiles
#
#  id                                  :bigint           not null, primary key
#  communication_preference            :integer
#  exposure_preference                 :integer
#  github                              :text
#  instagram                           :text
#  linkedin                            :text
#  main_framework                      :string
#  main_language                       :string
#  most_studied_language               :text             default([]), is an Array
#  most_studied_language_details       :string
#  study_duration                      :string
#  study_duration_details              :string
#  technologies                        :text             default([]), is an Array
#  track                               :string
#  wakatime                            :text
#  web_framework_studied               :text             default([]), is an Array
#  web_framework_studied_other_details :string
#  web_framework_study_duration        :string
#  created_at                          :datetime         not null
#  updated_at                          :datetime         not null
#  user_id                             :bigint           not null
#
# Indexes
#
#  index_student_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe StudentProfile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
