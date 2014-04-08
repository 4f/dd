# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 60) do

  create_table "albom_translations", :force => true do |t|
    t.integer  "albom_id"
    t.string   "locale",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "text"
    t.string   "title"
    t.string   "tumba"
  end

  add_index "albom_translations", ["albom_id"], :name => "index_albom_translations_on_albom_id"
  add_index "albom_translations", ["locale"], :name => "index_albom_translations_on_locale"

  create_table "alboms", :force => true do |t|
    t.integer  "concert_id"
    t.string   "title"
    t.text     "text"
    t.text     "tumba"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mainfoto"
    t.string   "fototitle_file_name"
    t.string   "fototitle_content_type"
    t.integer  "fototitle_file_size"
    t.datetime "fototitle_updated_at"
  end

  create_table "carousels", :force => true do |t|
    t.integer  "concert_id"
    t.integer  "foto_id"
    t.integer  "video_id"
    t.integer  "number"
    t.integer  "show_index"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "carousels", ["concert_id"], :name => "index_carousels_on_concert_id"
  add_index "carousels", ["foto_id"], :name => "index_carousels_on_foto_id"
  add_index "carousels", ["show_index"], :name => "index_carousels_on_show_index"

  create_table "concert_translations", :force => true do |t|
    t.integer  "concert_id"
    t.string   "locale",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "text1"
    t.text     "text2"
    t.text     "text3"
    t.string   "title"
    t.string   "title2"
    t.text     "home_pre"
    t.text     "home_after"
  end

  add_index "concert_translations", ["concert_id"], :name => "index_concert_translations_on_concert_id"
  add_index "concert_translations", ["locale"], :name => "index_concert_translations_on_locale"

  create_table "concerts", :force => true do |t|
    t.integer  "year"
    t.string   "title"
    t.text     "text1"
    t.text     "text2"
    t.text     "text3"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "members_page_id"
    t.string   "title2"
    t.text     "home_pre"
    t.text     "home_after"
  end

  create_table "contact_translations", :force => true do |t|
    t.integer  "contact_id"
    t.string   "locale",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "text"
  end

  add_index "contact_translations", ["contact_id"], :name => "index_contact_translations_on_contact_id"
  add_index "contact_translations", ["locale"], :name => "index_contact_translations_on_locale"

  create_table "contacts", :force => true do |t|
    t.integer  "multi"
    t.string   "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "feeds_rubrics", :id => false, :force => true do |t|
    t.integer "feed_id"
    t.integer "rubric_id"
  end

  add_index "feeds_rubrics", ["feed_id", "rubric_id"], :name => "index_feeds_rubrics_on_feed_id_and_rubric_id"
  add_index "feeds_rubrics", ["feed_id"], :name => "index_feeds_rubrics_on_feed_id"
  add_index "feeds_rubrics", ["rubric_id"], :name => "index_feeds_rubrics_on_rubric_id"

  create_table "feeds_tags", :id => false, :force => true do |t|
    t.integer "feed_id"
    t.integer "tag_id"
  end

  add_index "feeds_tags", ["feed_id", "tag_id"], :name => "index_feeds_tags_on_feed_id_and_tag_id"
  add_index "feeds_tags", ["feed_id"], :name => "index_feeds_tags_on_feed_id"
  add_index "feeds_tags", ["tag_id"], :name => "index_feeds_tags_on_tag_id"

  create_table "flag_translations", :force => true do |t|
    t.integer  "flag_id"
    t.string   "locale",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "country"
  end

  add_index "flag_translations", ["flag_id"], :name => "index_flag_translations_on_flag_id"
  add_index "flag_translations", ["locale"], :name => "index_flag_translations_on_locale"

  create_table "flags", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "country"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "fotos", :force => true do |t|
    t.integer  "concert_id"
    t.integer  "albom_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "fotos", ["albom_id"], :name => "index_fotos_on_albom_id"
  add_index "fotos", ["concert_id"], :name => "index_fotos_on_concert_id"

  create_table "help_page", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.text     "req"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "help_page_translations", :force => true do |t|
    t.integer  "help_page_id"
    t.string   "locale",       :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.text     "text"
    t.string   "title"
    t.text     "req"
  end

  add_index "help_page_translations", ["help_page_id"], :name => "index_help_page_translations_on_help_page_id"
  add_index "help_page_translations", ["locale"], :name => "index_help_page_translations_on_locale"

  create_table "home_translations", :force => true do |t|
    t.integer  "home_id"
    t.string   "locale",       :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.text     "preText"
    t.text     "postText"
    t.string   "title"
    t.string   "title2"
    t.string   "announcement"
  end

  add_index "home_translations", ["home_id"], :name => "index_home_translations_on_home_id"
  add_index "home_translations", ["locale"], :name => "index_home_translations_on_locale"

  create_table "homes", :force => true do |t|
    t.string   "title"
    t.string   "title2"
    t.text     "preText"
    t.text     "postText"
    t.date     "date"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "year_id"
    t.string   "announcement"
  end

  create_table "mailics", :force => true do |t|
    t.integer  "tipo"
    t.string   "name"
    t.string   "age"
    t.string   "phone"
    t.string   "email"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "ip"
  end

  add_index "mailics", ["created_at"], :name => "index_mailics_on_created_at"

  create_table "member_translations", :force => true do |t|
    t.integer  "member_id"
    t.string   "locale",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "remark"
    t.string   "city"
    t.string   "name"
  end

  add_index "member_translations", ["locale"], :name => "index_member_translations_on_locale"
  add_index "member_translations", ["member_id"], :name => "index_member_translations_on_member_id"

  create_table "members", :force => true do |t|
    t.integer  "concert_id"
    t.string   "name"
    t.string   "link"
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
    t.integer  "flag_id"
    t.string   "city"
    t.string   "remark"
    t.integer  "role"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "members", ["concert_id"], :name => "index_members_on_concert_id"
  add_index "members", ["role"], :name => "index_members_on_role"

  create_table "members_page_translations", :force => true do |t|
    t.integer  "members_page_id"
    t.string   "locale",          :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.text     "text_guest"
    t.text     "text_lead"
    t.text     "text_member"
  end

  add_index "members_page_translations", ["locale"], :name => "index_members_page_translations_on_locale"
  add_index "members_page_translations", ["members_page_id"], :name => "index_members_page_translations_on_members_page_id"

  create_table "members_pages", :force => true do |t|
    t.text     "text_lead"
    t.text     "text_guest"
    t.text     "text_member"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "mercury_images", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "news_feed_rubrics", :force => true do |t|
    t.integer  "feed_id"
    t.integer  "rubric_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "news_feed_rubrics", ["feed_id", "rubric_id"], :name => "index_news_feed_rubrics_on_feed_id_and_rubric_id"
  add_index "news_feed_rubrics", ["feed_id"], :name => "index_news_feed_rubrics_on_feed_id"
  add_index "news_feed_rubrics", ["rubric_id"], :name => "index_news_feed_rubrics_on_rubric_id"

  create_table "news_feed_tags", :force => true do |t|
    t.integer  "feed_id"
    t.integer  "tag_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "news_feed_tags", ["feed_id", "tag_id"], :name => "index_news_feed_tags_on_feed_id_and_tag_id"
  add_index "news_feed_tags", ["feed_id"], :name => "index_news_feed_tags_on_feed_id"
  add_index "news_feed_tags", ["tag_id"], :name => "index_news_feed_tags_on_tag_id"

  create_table "news_feed_translations", :force => true do |t|
    t.integer  "news_feed_id"
    t.string   "locale",       :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.text     "text"
    t.text     "preambula"
    t.string   "author"
    t.string   "title"
  end

  add_index "news_feed_translations", ["locale"], :name => "index_news_feed_translations_on_locale"
  add_index "news_feed_translations", ["news_feed_id"], :name => "index_news_feed_translations_on_news_feed_id"

  create_table "news_feeds", :force => true do |t|
    t.string   "title"
    t.text     "preambula"
    t.text     "text"
    t.string   "author"
    t.date     "date"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
  end

  create_table "news_rubric_translations", :force => true do |t|
    t.integer  "news_rubric_id"
    t.string   "locale",         :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "name"
  end

  add_index "news_rubric_translations", ["locale"], :name => "index_news_rubric_translations_on_locale"
  add_index "news_rubric_translations", ["news_rubric_id"], :name => "index_news_rubric_translations_on_news_rubric_id"

  create_table "news_rubrics", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "news_tag_translations", :force => true do |t|
    t.integer  "news_tag_id"
    t.string   "locale",      :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "name"
  end

  add_index "news_tag_translations", ["locale"], :name => "index_news_tag_translations_on_locale"
  add_index "news_tag_translations", ["news_tag_id"], :name => "index_news_tag_translations_on_news_tag_id"

  create_table "news_tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "partner_translations", :force => true do |t|
    t.integer  "partner_id"
    t.string   "locale",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "text"
    t.string   "logo"
    t.string   "name"
  end

  add_index "partner_translations", ["locale"], :name => "index_partner_translations_on_locale"
  add_index "partner_translations", ["partner_id"], :name => "index_partner_translations_on_partner_id"

  create_table "partners", :force => true do |t|
    t.integer  "concert_id"
    t.string   "name"
    t.string   "link"
    t.string   "text"
    t.boolean  "global",            :default => false
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  add_index "partners", ["concert_id"], :name => "index_partners_on_concert_id"

  create_table "settings", :force => true do |t|
    t.string   "var",                      :null => false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", :limit => 30
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "settings", ["thing_type", "thing_id", "var"], :name => "index_settings_on_thing_type_and_thing_id_and_var", :unique => true

  create_table "simple_captcha_data", :force => true do |t|
    t.string   "key",        :limit => 40
    t.string   "value",      :limit => 6
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "simple_captcha_data", ["key"], :name => "idx_key"

  create_table "team_translations", :force => true do |t|
    t.integer  "team_id"
    t.string   "locale",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "remark"
    t.string   "name"
  end

  add_index "team_translations", ["locale"], :name => "index_team_translations_on_locale"
  add_index "team_translations", ["team_id"], :name => "index_team_translations_on_team_id"

  create_table "teams", :force => true do |t|
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
    t.string   "name"
    t.string   "remark"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "admin"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "video_translations", :force => true do |t|
    t.integer  "video_id"
    t.string   "locale",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "title"
  end

  add_index "video_translations", ["locale"], :name => "index_video_translations_on_locale"
  add_index "video_translations", ["video_id"], :name => "index_video_translations_on_video_id"

  create_table "videos", :force => true do |t|
    t.integer  "concert_id"
    t.string   "link"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
    t.string   "title"
  end

  add_index "videos", ["concert_id"], :name => "index_videos_on_concert_id"

end
