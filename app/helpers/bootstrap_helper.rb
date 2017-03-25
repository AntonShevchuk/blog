module BootstrapHelper
  # Choose Boostrap class by flash type
  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  # Generate flash messages with Boostrap classes
  def boostrap_flash_messages
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, role: "alert", class: "alert #{bootstrap_class_for(msg_type)} sticky-top fade show") do
        concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
        concat message
      end)
    end
    nil
  end

  # Generate wrapper for form fields with errors placeholder
  def bootstrap_field_wrap(record, field)
    concat(content_tag(:div, class: "form-group" <<  ( record.errors.has_key?(field) ? " has-danger" : "")) do
      concat yield
      concat content_tag(:div, record.errors.full_messages_for(field).join('<br/>'), class: "form-control-feedback")
    end)
    nil
  end
  # Link Renderer for will_paginate
  # example of usage `will_paginate @pages, class: "blog-pagination", renderer: BootstrapHelper::LinkRenderer`
	class LinkRenderer < WillPaginate::ActionView::LinkRenderer
		protected
      def page_number(page)
        unless page == current_page
          link(page, page, :rel => rel_value(page), :class => 'btn btn-outline-primary')
        else
          link(page, "#", :class => 'btn btn-outline-secondary disabled')
        end
      end
      def previous_or_next_page(page, text, classname)
        if page
          link(text, page, :class => classname + ' btn btn-outline-primary')
        else
          link(text, "#", :class => classname + ' btn btn-outline-secondary disabled')
        end
      end
      def html_container(html)
        tag(:nav, html, container_attributes)
      end
	end
end
