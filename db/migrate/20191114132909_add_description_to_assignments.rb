class AddDescriptionToAssignments < ActiveRecord::Migration[5.2]
  def change
      add_column :assignments, :description, :string
  end
end
