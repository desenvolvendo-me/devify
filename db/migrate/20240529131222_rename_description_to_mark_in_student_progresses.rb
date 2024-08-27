class RenameDescriptionToMarkInStudentProgresses < ActiveRecord::Migration[7.0]
  def change
    rename_column :student_progresses, :description, :mark
  end
end
