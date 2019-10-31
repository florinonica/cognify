class AddAvatarToCourses < ActiveRecord::Migration[5.2]
  def change
    add_attachment :courses, :avatar
  end
end
