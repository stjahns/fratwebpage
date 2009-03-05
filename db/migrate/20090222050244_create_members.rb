class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string :name
      t.string :password_salt
      t.string :password_hash
      
      t.string :degree
      t.integer :grad_year
      t.string :position
      t.string :knickname
      t.string :favorite_quote
      
      t.integer :photo_id
      
      t.boolean :is_phi, :default => false
      
      t.timestamps
    end
    
    Member.create(:name => "Forrest", :password => "password", :password_confirmation => "password")
  end

  def self.down
    drop_table :members
  end
end
