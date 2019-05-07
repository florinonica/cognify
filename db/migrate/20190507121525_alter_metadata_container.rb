class AlterMetadataContainer < ActiveRecord::Migration[5.2]
  def change
    rename_column :metadata, :first_container_id, :container_id
    rename_column :metadata, :first_container_type, :container_type
  end
end
