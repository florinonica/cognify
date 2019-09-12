class RemoveRefferenceFromGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups, :users_id
    add_reference :groups, :user, foreign_key: true
  end
end
