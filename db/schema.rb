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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140329155035) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beds", force: true do |t|
    t.text     "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "frost_dates", force: true do |t|
    t.integer  "zipcode" # delete this
    t.date     "prob_fifty_percent"
    t.date     "pob_ten_percent"
    t.date     "prob_nintey_percent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seeds", force: true do |t|
    t.text     "variety"
    t.date     "suggested_sowing_date"
    t.date     "date_sown"
    t.integer  "germ_soil_temp"
    t.integer  "seed_depth"
    t.integer  "germination_days"
    t.integer  "height_when_mature"
    t.integer  "thin_to_grow"
    t.integer  "optimum_soil_ph"
    t.integer  "optimum_soil_temp"
    t.integer  "days_to_harvest"
    t.text     "planting_info"
    t.integer  "user_id"
    t.integer  "bed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.text     "name"
    t.text     "email"
    t.integer  "frostdate_id"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end