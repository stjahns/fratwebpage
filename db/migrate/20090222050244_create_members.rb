class CreateMembers < ActiveRecord::Migration
  def self.up
    begin
      create_table :members do |t|
        t.string :fname, :lname
        t.string :password_salt, :password_hash

        t.string :degree, :position, :nickname, :favorite_quote
        t.string :grad_year

        t.string :phone, :email

        t.integer :photo_id

        t.boolean :is_phi, :default => false
        t.boolean :is_alumni, :default => false

        t.string :summary, :limit => 500

        t.timestamps
      end

      m = Member.create(:fname => "Forrest", :lname => "Zeisler", :password => "password", :password_confirmation => "password", :nickname => "Trees")
      c = Member.create(:fname => "Chris", :lname => "Proulx", :password => "password", :password_confirmation => "password", :nickname => "Redhook")
      m.update_attribute(:is_phi,true)
      c.update_attribute(:is_phi,true)
    rescue Exception => e
      self.down
      raise e
    end
    
  end

  def self.down
    drop_table :members rescue nil
  end
end
