# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090304042954) do

  create_table "albums", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "name",        :default => "Event"
    t.string   "description", :default => ""
    t.datetime "when"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", :force => true do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "password_salt"
    t.string   "password_hash"
    t.string   "degree"
    t.integer  "grad_year"
    t.string   "position"
    t.string   "nickname"
    t.string   "favorite_quote"
    t.integer  "photo_id"
    t.boolean  "is_phi",         :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "album_id"
    t.integer  "album_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "wiki_pages", :force => true do |t|
    t.string   "name",            :default => "Wiki Page"
    t.text     "content"
    t.integer  "author_id"
    t.integer  "last_edit_by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
