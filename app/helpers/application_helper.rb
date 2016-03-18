module ApplicationHelper

  def full_title(page_title = '')
    base_title = "Squaw Valley Patrol Training App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  # def link_to_add_fields(name, f, association)
  #   new_object = f.object.class.reflect_on_association(association).klass.new
  #   fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do build

end
