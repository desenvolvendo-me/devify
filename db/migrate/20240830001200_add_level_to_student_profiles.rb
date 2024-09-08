class AddLevelToStudentProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :student_profiles, :level, :integer
  end
end
