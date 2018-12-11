class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title, null: false, default: ""
      t.string :description, null: false, default: ""
      t.references :category
      t.integer :price
      t.timestamps
    end
  end
end
