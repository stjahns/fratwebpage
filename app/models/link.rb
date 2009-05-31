class Link < ActiveRecord::Base
  belongs_to :member, :dependent =>  :destroy
  MY_TYPES = ["Facebook", "Twitter", "Smibs", "Personal", "Work", "Other"]
end
