class DropStudentsCoursesTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :courses_students
    drop_table :enrollments
  end
end
