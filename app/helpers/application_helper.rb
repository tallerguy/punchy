module ApplicationHelper

  LINK_COLORS = {
    clock_in: 'success',
    clock_out: 'danger'
  }

  def custom_bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'error'   if type == 'alert'
      text = ("<script>toastr.#{type}('#{message}');</script>")
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end

  def punch_link
    link_to(punch_title, punches_path, method: :post, class: "btn btn-#{LINK_COLORS[punch_title.downcase.gsub(' ', '_').to_sym]} btn-lg")
  end

  def punch_title
    current_user.clocked_in? ? 'Clock Out' : 'Clock In'
  end
end
