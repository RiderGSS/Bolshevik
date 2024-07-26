module ApplicationHelper
  def link_nav(title, link, options={})
    link_page = options.delete (:link_page)
    css_class =link_page==title ? 'text-gray-600   ' :'text-gray-900'
    options[:class] = if options[:class]
                        options[:class]+' '+css_class
                      else
                        css_class
                      end

    link_to title, link, options
  end
  def link_admin(title,link_page)
    link_page==title ? true: false
  end
  def currently_at(link_page = '')
    render partial: "shared/menu",locals: {link_page: link_page}
  end
  def currently_admin(link_page = '')
    render partial: "admin/admin_panel",locals: {link_page: link_page}
  end



  # Возвращает полный заголовок на основе заголовка страницы.
  def full_title(page_title = '')
    base_title = "ДНТ 'Большевик' "
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
    end
end
