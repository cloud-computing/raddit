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

ActiveRecord::Schema.define(:version => 20100212003003) do

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.integer  "user_id",                    :null => false
    t.integer  "story_id",                   :null => false
    t.integer  "reply_to_id", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stories", :force => true do |t|
    t.string   "title",                              :null => false
    t.text     "description",                        :null => false
    t.string   "link",        :default => "http://", :null => false
    t.string   "media",                              :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location",                  :limit => 40,  :default => ""
    t.string   "country",                   :limit => 2,   :default => ""
    t.string   "postal_code",                              :default => ""
    t.date     "birthdate"
    t.text     "about_me"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

  create_table "votes", :force => true do |t|
    t.string   "voteable_type", :default => ""
    t.integer  "voteable_id",   :default => 0
    t.integer  "user_id",       :default => 0
    t.boolean  "voting"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["voteable_type", "voteable_id", "user_id"], :name => "index_votes_on_voteable_type_and_voteable_id_and_user_id"
  add_index "votes", ["voteable_type", "voteable_id", "voting"], :name => "index_votes_on_voteable_type_and_voteable_id_and_voting"

end
