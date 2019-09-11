class Admin < User
  def self.model_name
    User.model_name
  end

  def can_create_category?
    true
  end

  def can_edit_category?(category)
    true
  end

  def can_delete_category?(category)
    true
  end

  def can_create_course?
    true
  end

  def can_edit_course?(course)
    true
  end

  def can_delete_course?(course)
    true
  end

  def can_create_module?
    true
  end

  def can_edit_module?(course_module)
    true
  end

  def can_delete_module?(course_module)
    true
  end

  def can_delete_attachment?(attachment)
    true
  end

  def can_add_teacher?
    true
  end

  def can_create_group?
    true
  end
end
