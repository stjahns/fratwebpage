class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name, :default => "Event"
      t.string :description, :default => ""
      t.timestamp :when
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end