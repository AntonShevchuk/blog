module ApplicationHelper

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
end
