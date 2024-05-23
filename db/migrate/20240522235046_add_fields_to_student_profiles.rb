class AddFieldsToStudentProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :student_profiles, :github, :text
    add_column :student_profiles, :wakatime, :text
    add_column :student_profiles, :linkedin, :text
  end
end
