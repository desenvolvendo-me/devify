# == Schema Information
#
# Table name: study_areas
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe StudyArea, type: :model do
  it "is valid with a valid name" do
    programming_language = build(:programming_language)
    expect(programming_language).to be_valid
  end

  it "is invalid without a name" do
    programming_language = build(:programming_language, name: nil)
    programming_language.valid?
    expect(programming_language.errors[:name]).to include("não pode ficar em branco")
  end
end
