# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def short_time(time)
    time.strftime("%d/%m/%y %H:%M") 
  end
end
