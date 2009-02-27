class CreateWikiPages < ActiveRecord::Migration
  def self.up
    create_table :wiki_pages do |t|
      t.string :name, :default => "Wiki Page"
      t.text :content
      
      t.integer :author_id
      t.integer :last_edit_by_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :wiki_pages
  end
end
