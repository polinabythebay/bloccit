module ApplicationHelper
  def form_group_tag(errors, &block)
    if errors.any?
      content.tag :div, capture(&block), class: 'form-group has-error'
    else
      content.tag :div, capture(&block), class: 'form-group'
    end
  end
end
