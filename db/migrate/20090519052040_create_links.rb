class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.string :my_type
      t.string :url
      
      t.integer :member_id
    end
  end

  def self.down
    drop_table :links
  end
end
