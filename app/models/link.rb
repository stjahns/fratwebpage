class Link < ActiveRecord::Base
  belongs_to :member, :dependent =>  :destroy
   attr_accessible :url, :my_type
  MY_TYPES = ["Facebook", "Twitter", "Smibs", "Personal", "Work", "Other"]
end
