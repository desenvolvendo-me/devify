class CreateStudentProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :student_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :main_language
      t.string :main_framework
      t.string :track
      t.text :github
      t.text :wakatime
      t.text :linkedin
      t.text :instagram
      t.text :technologies, array: true, default: []
      t.text :most_studied_language, array: true, default: []
      t.string :study_duration
      t.text :web_framework_studied, array: true, default: []
      t.string :web_framework_study_duration
      t.string :most_studied_language_details
      t.string :web_framework_studied_other_details
      t.string :study_duration_details
      t.integer :communication_preference
      t.integer :exposure_preference

      t.timestamps
    end
  end
end

