class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.float :value, null: false
      t.datetime :date
      t.references :users
      t.integer :container_id
      t.string :container_type
      t.timestamps
    end
  end
end
