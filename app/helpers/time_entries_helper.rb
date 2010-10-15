module TimeEntriesHelper
  def format_time(duration)
    if duration < 60
      pluralize(duration, 'minutes')
    else
      hours = duration / 60
      minutes = duration % 60
      output = pluralize(hours, 'hours')
      output += ", " + pluralize(minutes, 'minutes') if minutes != 0
      output
    end
  end
end
