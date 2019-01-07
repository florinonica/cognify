class CreateEnrollments < ActiveRecord::Migration[5.2]
  def change
    create_table :enrollments do |t|
      t.references :user
      t.references :course
      t.datetime :start
      t.datetime :end
      t.timestamps
    end
  end
end
