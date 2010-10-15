module TimeEntriesHelper
  def format_time(duration)
    if duration.blank?
      "0 minutes"
    elsif duration < 60
      pluralize(duration, 'minutes')
    else
      hours = duration / 60
      minutes = duration % 60
      output = pluralize(hours, 'hour')
      output += ", " + pluralize(minutes, 'minute') if minutes != 0
      output
    end
  end
end
