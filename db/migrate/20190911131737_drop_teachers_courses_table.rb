class DropTeachersCoursesTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :teachers_courses_tables
  end
end
