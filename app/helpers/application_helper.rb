module ApplicationHelper

  def navbar_link
    content_tag(:ul, class: "nav nav-sidebar") do
      yield
    end
  end

  def nav_link (text, path)
    options = current_page?(path) ? { class: "active" } : {}
    content_tag(:li, options) do
      link_to text, path
    end
  end
end
