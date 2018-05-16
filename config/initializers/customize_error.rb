ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
	puts html_tag
	class_attr_index = html_tag.index 'class="'
  if class_attr_index
    %(#{html_tag}<span class="validation-error">
      #{instance.error_message.join(',')}</span>).html_safe
  else
    html_tag.insert html_tag.index('>'), ' class="validation-error"'
  end
end
