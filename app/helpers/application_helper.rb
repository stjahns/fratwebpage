# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def flash_notices
    if flash[:notice]
      str = "<div class='success-notice'>#{flash[:notice]}</div><br/>"
    elsif flash[:error]
      str = "<div class='error-notice'>#{flash[:error]}</div><br/>"
    end
    flash.discard
    str
  end
  
end
