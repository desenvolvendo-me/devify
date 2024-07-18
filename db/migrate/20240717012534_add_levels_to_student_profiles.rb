class AddLevelsToStudentProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :student_profiles, :level_profile, :integer
    add_column :student_profiles, :level_profile_survey, :integer
  end
end
