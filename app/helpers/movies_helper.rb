module MoviesHelper
  def sortable_header(column, title)
    is_sorted = (@sort_by == column)
    current_direction = is_sorted ? @sort_direction : nil
    next_direction = (is_sorted && current_direction == 'asc') ? 'desc' : 'asc'

    css_classes = []
    if is_sorted
      css_classes << 'hilite'
      css_classes << (current_direction == 'asc' ? 'sorted-asc' : 'sorted-desc')
    end

    indicator = if is_sorted
                  current_direction == 'asc' ? ' ▲' : ' ▼'
                else
                  ''
                end

    content_tag(:th, class: (css_classes.join(' ') if css_classes.any?), id: "#{column}_header") do
      link_to("#{title}#{indicator}", movies_path(sort_by: column, direction: next_direction), id: "#{column}_sort_link")
    end
  end

  def column_cell_class(column)
    return unless @sort_by == column

    @sort_direction == 'asc' ? 'sorted-asc' : 'sorted-desc'
  end
end
