class CorrectStudentProfileFields < ActiveRecord::Migration[7.0]
  def change
    rename_column :student_profiles, :most_studied_language_details, :most_studied_language_other_details

    change_column :student_profiles, :most_studied_language_other_details, :text, array: true, using: "string_to_array(most_studied_language_other_details, ',')", default: []
    change_column :student_profiles, :web_framework_studied_other_details, :text, array: true, using: "string_to_array(web_framework_studied_other_details, ',')", default: []
    add_column :student_profiles, :technology_other_details, :text,array: true, using: "string_to_array(web_framework_studied_other_details, ',')", default: []
    add_column :student_profiles, :web_framework_study_duration_details, :integer, default: 0
  end
end
