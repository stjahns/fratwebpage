class Event < ActiveRecord::Base
  
  validates_length_of :name, :within => 1..250
  validates_length_of :description, :within => 1..250

  def Event.find_all_by_date(date)
    return self.find(:all).select{|event| event.when.year == date.year and event.when.month == date.month  and  event.when.day == date.day}
  end

end
