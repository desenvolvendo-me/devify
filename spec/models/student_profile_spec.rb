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
require 'rails_helper'

RSpec.describe StudentProfile, type: :model do
  it { should belong_to(:user) }

  it 'validates github url' do
    should allow_value('http://github.com/user').for(:github)
    should_not allow_value('github.com/user').for(:github)
  end

  it 'validates wakatime url' do
    should allow_value('http://wakatime.com/user').for(:wakatime)
    should_not allow_value('wakatime.com/user').for(:wakatime)
  end

  it 'validates linkedin url' do
    should allow_value('http://linkedin.com/in/user').for(:linkedin)
    should_not allow_value('linkedin.com/in/user').for(:linkedin)
  end

  it 'validates instagram url' do
    should allow_value('http://instagram.com/user').for(:instagram)
    should_not allow_value('instagram.com/user').for(:instagram)
  end

  it "has a valid factory" do
    expect(FactoryBot.create(:student_profile)).to be_valid
  end
end


