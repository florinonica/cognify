class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.datetime :due_date
      t.integer :container_id
      t.string :container_type
      t.timestamps
    end
  end
end
