class RenameLanguageToMainLanguageAndAddMainFrameworkToStudentProfiles < ActiveRecord::Migration[7.0]
  def change
    rename_column :student_profiles, :language, :main_language
    add_column :student_profiles, :main_framework, :string
  end
end
