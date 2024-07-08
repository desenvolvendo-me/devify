class CreateJoinTableStudentProfilesProjectSimulations < ActiveRecord::Migration[7.0]
  def change
    create_join_table :student_profiles, :project_simulations do |t|
      t.index :student_profile_id, name: 'index_student_profiles_on_profile_id'
      t.index :project_simulation_id, name: 'index_project_simulations_on_simulation_id'
    end
  end
end
