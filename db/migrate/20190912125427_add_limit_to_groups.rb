class AddLimitToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :limit, :integer
  end
end
