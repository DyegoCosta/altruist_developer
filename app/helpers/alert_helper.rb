module AlertHelper
  def notice(msg = nil)
    dismissable_alert(msg, 'alert-success')
  end

  def alert(msg = nil)
    dismissable_alert(msg, 'alert-danger')
  end

  private

  def dismissable_alert(msg, alert_class)
    if(msg)
      content_tag(:div, class: "alert #{alert_class} alert-dismissable") do
        button_tag('×', class: 'close', data: { dismiss: 'alert', hidden: 'true' }) +
          msg 
      end
    end
  end
end
