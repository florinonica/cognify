class CreateMetadata < ActiveRecord::Migration[5.2]
  def change
    create_table :metadata do |t|
      t.integer :first_container_id
      t.string :first_container_type
      t.integer :second_container_id
      t.string :second_container_type
      t.timestamps
    end
  end
end
