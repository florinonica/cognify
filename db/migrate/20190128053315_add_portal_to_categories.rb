class AddPortalToCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :portal, foreign_key: true
  end
end
