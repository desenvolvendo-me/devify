class RemoveUnnecessaryFieldsFromStudentProfiles < ActiveRecord::Migration[7.0]
  def change
    remove_column :student_profiles, :most_studied_language_other_details, :text, array: true, default: []
    remove_column :student_profiles, :web_framework_studied_other_details, :text, array: true, default: []
    remove_column :student_profiles, :technology_other_details, :text, array: true, default: []
    remove_column :student_profiles, :web_framework_study_duration_details, :integer, default: 0
    remove_column :student_profiles, :study_duration_details,:string
  end
end
