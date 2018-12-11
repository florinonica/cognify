class CreateCourseModules < ActiveRecord::Migration[5.2]
  def change
    create_table :course_modules do |t|
      t.string :title, null: false, default: ""
      t.string :description, null: false, default: ""
      t.references :course
      t.timestamps
    end
  end
end
