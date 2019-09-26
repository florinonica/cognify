class RepairGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups, :user_id
    add_column :groups, :teacher_id, :integer
    add_index :groups, :teacher_id
  end
end
