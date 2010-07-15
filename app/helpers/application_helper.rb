module ApplicationHelper
  def readable_timestamp(timestamp)
    return timestamp.strftime("%a, %d %b %Y, %Hh%M")
  end
end
