class AddPortalToCourses < ActiveRecord::Migration[5.2]
  def change
    add_reference :courses, :portal, foreign_key: true
  end
end
