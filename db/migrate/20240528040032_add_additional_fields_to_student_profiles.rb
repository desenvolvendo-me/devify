class AddAdditionalFieldsToStudentProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :student_profiles, :most_studied_language, :text, array: true, default: []
    add_column :student_profiles, :study_duration, :string
    add_column :student_profiles, :web_framework_studied, :text, array: true, default: []
    add_column :student_profiles, :web_framework_study_duration, :string
    add_column :student_profiles, :most_studied_language_details, :string
    add_column :student_profiles, :web_framework_studied_other_details, :string
    add_column :student_profiles, :study_duration_details, :string
  end
end
