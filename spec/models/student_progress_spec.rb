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
require 'rails_helper'

RSpec.describe StudentProgress, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
