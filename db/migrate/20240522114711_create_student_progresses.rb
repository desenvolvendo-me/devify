class CreateStudentProgresses < ActiveRecord::Migration[7.0]
  def change
    create_table :student_progresses do |t|
      t.date :date
      t.string :description
      t.string :programming_language
      t.string :study_area
      t.integer :value

      t.timestamps
    end
  end
end
