class CreateTeachersCoursesJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :teachers, :courses do |t|
      t.index :teacher_id
      t.index :course_id
    end
  end
end
