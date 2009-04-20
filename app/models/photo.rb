class Photo < ActiveRecord::Base
  belongs_to :album
  has_attached_file :image, :styles => {:large => "600x600", :medium => "300x300>", :thumb => "80x80>" }
  
  attr_accessible :image
  
end
