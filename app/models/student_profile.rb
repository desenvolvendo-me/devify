# == Schema Information
#
# Table name: student_profiles
#
#  id         :bigint           not null, primary key
#  github     :text
#  language   :string
#  linkedin   :text
#  track      :string
#  wakatime   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
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

  validates :github, :wakatime, :linkedin, allow_blank: true, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "only allows valid URLs" }
end
