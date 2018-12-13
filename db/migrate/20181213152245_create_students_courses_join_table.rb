class CreateStudentsCoursesJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :students, :courses do |t|
      t.index :student_id
      t.index :course_id
    end
  end
end
