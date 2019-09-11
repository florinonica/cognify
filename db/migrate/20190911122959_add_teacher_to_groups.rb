class AddTeacherToGroups < ActiveRecord::Migration[5.2]
  def change
    add_reference :groups, :users, foreign_key: true
  end
end
