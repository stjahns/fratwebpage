class Album < ActiveRecord::Base
  has_many :photos
  
  attr_writer :initial_photos, :photo_order
  attr_accessible :initial_photos, :name, :photo_order, :description
  
  validates_length_of :name, :minimum => 1
  
  
  before_save :store_initial_photos
  def store_initial_photos
    @initial_photos.each{|ph|
      unless ph.blank?
        self.photos.build(:image => ph)
      end
    }
  end
  
  after_save :save_photo_order
  def save_photo_order
    return if @photo_order.blank?
    @photo_order = @photo_order.split(",") if @photo_order.is_a?(String)
    @photos = []
    
    @photo_order.each{|ph_id|
      @photos << self.photos.find(ph_id) rescue nil
    }
    
    @photos.each{|ph|
      ph.update_attribute(:album_order, @photo_order.index(ph.id.to_s))
    }
  end
  
  
  def cover_image
    self.photos.in_order.find(:first)
  end
  
  
  def photo_order
    self.photos.in_order.collect(&:id).join(",")
  end
  
  
end
