class Link < ActiveRecord::Base
  belongs_to :member, :dependent =>  :destroy
   attr_accessible :url, :my_type, :member_id
   validates_presence_of :my_type
   validates_length_of :url, :minimum => 1
  MYTYPES = ["Facebook", "Twitter", "Smibs", "Personal", "Work", "Other"]
end
