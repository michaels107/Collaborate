# Created 7/24/2020 by Duytan Tran
# Edited 7/27/2020 by Duytan Tran
module ApplicationHelper
  # Created 7/27/2020 by Duytan Tran
  # Helper for form alerts
  def alert_class(flash_type)
    case flash_type.to_sym
    when :notice
      'alert-success'
    when :alert
      'alert-warning'
    when :error
      'alert-danger'
    end
  end
end
