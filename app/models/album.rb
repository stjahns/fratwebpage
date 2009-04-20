class Album < ActiveRecord::Base
  has_many :photos
  
  
  attr_writer :initial_photos
  
  validates_length_of :name, :minimum => 1
  
  
  before_save :store_initial_photos
  def store_initial_photos
    @initial_photos.each{|ph|
      self.photos.build(:image => ph)
    }
  end
  
  def cover_image
    self.photos.find(:first)
  end
  
  
end
