class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :groupname, null: false, default: ""
      t.boolean :is_public
      t.references :course
      t.timestamps
    end
  end
end
