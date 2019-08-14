class AddUserToAssignments < ActiveRecord::Migration[5.2]
  def change
    add_reference :assignments, :users, foreign_key: true
  end
end
