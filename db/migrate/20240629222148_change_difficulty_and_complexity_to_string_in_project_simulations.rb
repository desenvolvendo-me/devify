class ChangeDifficultyAndComplexityToStringInProjectSimulations < ActiveRecord::Migration[7.0]
  def change
    change_column :project_simulations, :difficulty, :string
    change_column :project_simulations, :complexity, :string
  end
end
