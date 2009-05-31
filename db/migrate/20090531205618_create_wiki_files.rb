class CreateWikiFiles < ActiveRecord::Migration
  def self.up
    create_table :wiki_files do |t|

      t.string    :data_file_name
      t.string    :data_content_type
      t.integer   :data_file_size
      t.datetime  :data_updated_at

      t.integer   :wiki_page_id

    end
  end

  def self.down
    drop_table :wiki_files
  end
end
