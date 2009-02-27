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
    all_names = WikiPages.all.collect(&:name).each(&:strip!)
    all_names.each{|name|
      if name.upcase.begins_with(/THE|A|IF/)
        name.sub(/THE|A|IF/.)
      end
    }
  end
  
end
