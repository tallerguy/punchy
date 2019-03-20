class PunchDecorator < Draper::Decorator

  TYPE_COLORS = {
    clock_in: 'primary',
    clock_out: 'success'
  }

  delegate_all

  def type_badge
    h.content_tag(:span, punch_type, class: "badge badge-#{TYPE_COLORS[punch_type.downcase.gsub(' ', '_').to_sym]}")
  end

  def formatted_date(date)
    date.strftime(Punch::DATE_FORMAT)
  end
end
