class AddDifficultyAndComplexityToProjectSimulations < ActiveRecord::Migration[7.0]
  def change
    add_column :project_simulations, :difficulty, :integer
    add_column :project_simulations, :complexity, :integer
  end
end
