class UpdateStudentProgressAssociations < ActiveRecord::Migration[7.0]
  def change
    remove_column :student_progresses, :programming_language, :string
    remove_column :student_progresses, :study_area, :string
    add_reference :student_progresses, :programming_language, foreign_key: true
    add_reference :student_progresses, :study_area, foreign_key: true
    add_reference :student_progresses, :user, foreign_key: true
  end
end
