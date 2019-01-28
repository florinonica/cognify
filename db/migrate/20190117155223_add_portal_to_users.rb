class AddPortalToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :portal, foreign_key: true
  end
end
