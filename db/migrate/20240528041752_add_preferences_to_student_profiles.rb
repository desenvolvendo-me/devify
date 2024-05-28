class AddPreferencesToStudentProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :student_profiles, :communication_preference, :integer
    add_column :student_profiles, :exposure_preference, :integer
  end
end
