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

class StudentProfile < ApplicationRecord
  belongs_to :user
  belongs_to :client, optional: true
  has_and_belongs_to_many :project_simulations

  validates :github, :wakatime, :linkedin, :instagram, allow_blank: true, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "only allows valid URLs" }

  enum duration: [
    :never,
    :three_months,
    :six_months,
    :twelve_months
  ],_suffix: true

  def self.duration_options
    durations.keys.map { |key| [I18n.t("views.manager.students.enums.duration.#{key}"), key] }
  end

  def translated_study_duration
    I18n.t("views.manager.students.enums.duration.#{study_duration}")
  end

  def translated_web_framework_study_duration
    I18n.t("views.manager.students.enums.duration.#{web_framework_study_duration}")
  end
end
