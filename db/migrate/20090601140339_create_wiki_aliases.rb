class CreateWikiAliases < ActiveRecord::Migration
  def self.up
    create_table :wiki_aliases do |t|
      t.integer :wiki_page_id
      t.string :name
    end
  end

  def self.down
    drop_table :wiki_aliases
  end
end
