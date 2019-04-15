class AlterMetadata < ActiveRecord::Migration[5.2]
  def change
    remove_column :metadata, :second_container_type, :string
    remove_column :metadata, :second_container_id, :integer
    add_reference :metadata, :portal, foreign_key: true
  end
end
