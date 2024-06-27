class CreateJoinTableUserProjectSimulation < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :project_simulations do |t|
      t.index [:user_id, :project_simulation_id], unique: true, name: 'index_user_project_simulation_on_user_and_project'
      t.index [:project_simulation_id, :user_id], name: 'index_project_simulation_on_project_and_user'
    end
  end
end
