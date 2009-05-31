class WikiPage < ActiveRecord::Base
  belongs_to :author, :class_name => "Member"
  belongs_to :last_edit_by, :class_name => "Member"
  has_many :wiki_files
  
  attr_accessible :name, :content, :wiki_files_accessor, :files_to_delete
  named_scope :sorted_by_name, :order => "name"
  
  validates_uniqueness_of :name, :message => "must be unique"
  
  def validate
    #m = WikiPage.find(:first, :conditions => ["id <> ? AND (name LIKE '%?%' or ? LIKE '%'+name+'%' )",self.id,self.name,self.name])
    #self.errors.add(:name, "cannot be a subset or superset of another wiki page's name (#{m.name})") if m
  end
  
  before_create :check_last_edit
  def check_last_edit
    self.last_edit_by = self.author unless self.last_edit_by 
  end
  
  after_save :delete_files
  def delete_files
    self.wiki_files.select{|f| f[:delete]}.each(&:destroy) rescue nil
  end
  
  def linked_content
    cleaned_content = self.content.clone
    all = WikiPage.all
    all.delete(self)
    all.each{|w|
      w.name.sub!(/THE\s|A\s|IF\s/i,"") #add regex to keep it to the front of the line and case insensitive
      w.name.strip!
    }
    all = all.sort_by{|w| -w.name.length}
    all.each{|w| cleaned_content.gsub!(/#{w.name}/i,"<a href='/wiki_pages/#{w.id}'>#{w.name}</a>")}
    cleaned_content
  end
  
  def wiki_files_accessor=(array)
    array = [array] unless array.is_a?(Array)
    array.each{|file|
      unless file.blank?
        self.wiki_files.build(:data => file)
      end
    }
  end
  
  def files_to_delete=(array)
    array = array.gsub(/\s/,"").split(",").reject(&:blank?).collect(&:to_i) if array.is_a?(String)
    unless array.blank?
      self.wiki_files.find(array).each{|d| d[:delete] = true}
    end
  end
  
end
