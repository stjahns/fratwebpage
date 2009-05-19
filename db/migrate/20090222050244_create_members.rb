class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string :fname, :lname
      t.string :password_salt, :password_hash
      
      t.string :degree, :position, :nickname, :favorite_quote
      t.integer :grad_year
      
      t.string :phone, :email
      
      t.integer :photo_id
      
      t.boolean :is_phi, :default => false
      t.boolean :is_alumni, :default => false
      
      t.timestamps
    end
    
    m = Member.create(:fname => "Forrest", :lname => "Zeisler", :password => "password", :password_confirmation => "password", :nickname => "Trees")
    m.update_attribute(:is_phi,true)
  end

  def self.down
    drop_table :members
  end
end
