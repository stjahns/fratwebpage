class WikiFile < ActiveRecord::Base
  has_attached_file :data
  
  belongs_to :wiki_page
end
