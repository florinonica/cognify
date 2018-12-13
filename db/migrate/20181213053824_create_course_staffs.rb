class CreateCourseStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :course_staffs do |t|

      t.timestamps
    end
  end
end
