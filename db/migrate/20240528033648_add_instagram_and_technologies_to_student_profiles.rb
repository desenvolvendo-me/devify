class AddInstagramAndTechnologiesToStudentProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :student_profiles, :instagram, :text
    add_column :student_profiles, :technologies, :text, array: true, default: []
  end
end
