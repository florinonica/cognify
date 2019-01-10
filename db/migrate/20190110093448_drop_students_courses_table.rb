class DropStudentsCoursesTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :courses_students
  end
end
