class Member < ActiveRecord::Base
  validates_length_of :password, :within => (6..20), :allow_nil => true, :if => :new_record?
  validates_length_of :name, :minimum => 1
  
  attr_accessor :password, :password_confirmation
  attr_accessible :name, :password, :password_confirmation, :knickname, :position
  
  before_save :set_password
  
  def validate
    if @password
      errors.add(:password_confirmation,"Confirmation password does not match") unless @password==@password_confirmation
    end
  end
  
  
  #this function returns a user if both the username and password match. otherwise it returns nil. usernames must be unique.
  def self.authenticate(name,password)
    mem = self.find(:first, :conditions => ['name = ?', name])
    if(mem.blank? ||
      Digest::SHA1.hexdigest(password + mem.password_salt)!= mem.password_hash)
      return nil
    end
    mem    
  end
  
  protected
  
  def set_password
    return unless @password
    salt = [Array.new(6){rand(256).chr}.join].pack('m').chomp
    self.password_salt, self.password_hash = 
      salt, Digest::SHA1.hexdigest(@password + salt)
  end
  
end
