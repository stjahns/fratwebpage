class Photo < ActiveRecord::Base
  belongs_to :album
  has_attached_file :image, :styles => {:large => "600x600", :medium => "300x300>", :thumb => "120x120>" }
  
  attr_accessible :image
  
  named_scope :in_order, :order => "album_order"
end
