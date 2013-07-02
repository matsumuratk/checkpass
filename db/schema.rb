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

ActiveRecord::Schema.define(:version => 20130625084848) do

  create_table "admin_masters", :force => true do |t|
    t.string   "master_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "checkin_items", :force => true do |t|
    t.string   "access_key"
    t.string   "item_name"
    t.datetime "create_datetime"
    t.integer  "status",              :default => 1
    t.date     "start_date"
    t.date     "payment_date"
    t.date     "limit_date"
    t.string   "fbUserId"
    t.string   "fbShopId"
    t.string   "fbCheckinId"
    t.string   "fbName"
    t.string   "fbCategory"
    t.string   "fbCountry"
    t.string   "fbState"
    t.string   "fbCity"
    t.string   "fbStreet"
    t.string   "title"
    t.binary   "top_image"
    t.string   "top_image_text"
    t.integer  "top_image_select"
    t.binary   "middle_image"
    t.string   "middle_image_text"
    t.integer  "middle_image_select"
    t.binary   "coupon_image"
    t.string   "coupon_image_text"
    t.integer  "coupon_image_select"
    t.string   "comment_title"
    t.string   "comment_message"
    t.string   "wall_name"
    t.string   "wall_link"
    t.string   "wall_caption"
    t.string   "wall_description"
    t.binary   "wall_picture"
    t.string   "wall_message"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.datetime "cancel_date"
    t.boolean  "post_wall_check",     :default => true
    t.string   "fbTitle"
  end

  create_table "checkin_logs", :force => true do |t|
    t.string   "fbUserId"
    t.string   "fbShopId"
    t.string   "fbCheckinUserId"
    t.string   "fbCheckinUserName"
    t.string   "access_key"
    t.string   "title"
    t.datetime "checkin_date"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "checkin_pv_items", :force => true do |t|
    t.datetime "create_datetime"
    t.string   "fbUserId"
    t.binary   "top_image"
    t.binary   "middle_image"
    t.binary   "coupon_image"
    t.binary   "wall_picture"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "payed_logs", :force => true do |t|
    t.string   "fbUserId"
    t.string   "access_key"
    t.string   "subscr_id"
    t.string   "txn_type"
    t.string   "payer_email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "verify_sign"
    t.string   "ipn_track_id"
    t.string   "payer_date"
    t.datetime "subscr_date"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "shops", :force => true do |t|
    t.string   "fbUserId"
    t.string   "fbShopId"
    t.string   "fbName"
    t.datetime "regist_datetime"
    t.string   "shop_name"
    t.string   "manager_name"
    t.string   "manager_mail"
    t.string   "manager_tel"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "coupon_code"
  end

end
