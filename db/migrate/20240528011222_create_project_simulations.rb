class CreateProjectSimulations < ActiveRecord::Migration[7.0]
  def change
    create_table :project_simulations do |t|
      t.string :title
      t.text :description
      t.text :objectives
      t.text :tools
      t.text :expected_results

      t.timestamps
    end
  end
end
