module ApplicationHelper

  def full_title(page_title = '')
    base_title = "Squaw Valley Patrol Training App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def link_to_add_fields(name, f, association)

    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
  end


end
