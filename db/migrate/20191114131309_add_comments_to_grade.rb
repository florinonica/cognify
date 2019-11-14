class AddCommentsToGrade < ActiveRecord::Migration[5.2]
  def change
      add_column :grades, :comment, :string
  end
end
