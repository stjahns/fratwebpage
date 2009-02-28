class WikiPage < ActiveRecord::Base
  belongs_to :author, :class_name => "Member"
  belongs_to :last_edit_by, :class_name => "Member"
  
  attr_accessible :name, :content
  named_scope :sorted_by_name, :order => "name"
  
  before_create :check_last_edit
  def check_last_edit
    self.last_edit_by = self.author unless self.last_edit_by 
  end
  
  def linked_content
    cleaned_content = self.content
    all = WikiPage.all
    all.delete(self)
    all.each{|w|
      w.name.sub!(/THE\s|A\s|IF\s/,"") #add regex to keep it to the fron of the line and case insensitive
      w.name.strip!
    }
    all = all.sort_by{|w| -w.name.length}
    all.each{|w| cleaned_content.gsub!(/#{w.name}/,"<a href='/wiki_pages/#{w.id}'>#{w.name}</a>")}
    cleaned_content
  end
  
end
