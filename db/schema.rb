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

ActiveRecord::Schema.define(version: 20170621195702) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer "commentable_id"
    t.string "commentable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "experiments", force: :cascade do |t|
    t.string "category", null: false
    t.text "results", null: false
    t.text "conclusions", null: false
    t.integer "proposal_id"
    t.integer "experimenter_id"
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.string "observable_type"
    t.bigint "observable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_experiments_on_commentable_type_and_commentable_id"
    t.index ["observable_type", "observable_id"], name: "index_experiments_on_observable_type_and_observable_id"
  end

  create_table "observations", force: :cascade do |t|
    t.integer "observable_id"
    t.string "observable_type"
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_observations_on_commentable_type_and_commentable_id"
  end

  create_table "procedures", force: :cascade do |t|
    t.string "steps", null: false
    t.integer "experiment_id"
    t.string "observable_type"
    t.bigint "observable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["observable_type", "observable_id"], name: "index_procedures_on_observable_type_and_observable_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.text "summary", null: false
    t.string "hypothesis", null: false
    t.string "status", null: false
    t.integer "proposer_id"
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_proposals_on_commentable_type_and_commentable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end