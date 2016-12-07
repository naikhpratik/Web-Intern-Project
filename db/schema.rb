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

ActiveRecord::Schema.define(version: 20161207210051) do

  create_table "audios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "play_count"
  end

  create_table "contents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "product_id"
    t.integer  "parent_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "ancestry"
    t.string   "actable_type"
    t.integer  "actable_id"
    t.string   "name"
    t.integer  "view_count"
    t.integer  "time"
    t.index ["actable_type", "actable_id"], name: "index_contents_on_actable_type_and_actable_id", using: :btree
    t.index ["ancestry"], name: "index_contents_on_ancestry", using: :btree
    t.index ["product_id"], name: "fk_rails_6f4dae6b48", using: :btree
  end

  create_table "contributions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "content_id"
    t.integer "product_id"
    t.index ["content_id"], name: "index_contributions_on_content_id", using: :btree
    t.index ["product_id"], name: "index_contributions_on_product_id", using: :btree
    t.index ["user_id"], name: "index_contributions_on_user_id", using: :btree
  end

  create_table "flashcard_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "front",      limit: 65535
    t.text     "back",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "flashcards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
  end

  create_table "htmls", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "has_plain_text"
    t.text    "description",    limit: 65535
  end

  create_table "modulees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "visibility"
  end

  create_table "quiz_questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "question",      limit: 65535
    t.text     "hint",          limit: 65535
    t.integer  "content_id"
    t.string   "question_type"
    t.text     "correct",       limit: 65535
    t.text     "distractors",   limit: 65535
    t.text     "explination",   limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "quizzes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_contents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "contents_id"
    t.integer "user_id"
    t.integer "starttime"
    t.integer "stoptime"
    t.index ["contents_id"], name: "index_user_contents_on_contents_id", using: :btree
    t.index ["user_id"], name: "index_user_contents_on_user_id", using: :btree
  end

  create_table "user_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "role_id"
    t.index ["product_id"], name: "index_user_products_on_product_id", using: :btree
    t.index ["user_id"], name: "index_user_products_on_user_id", using: :btree
  end

  create_table "user_roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "role_id"
    t.index ["role_id"], name: "fk_rails_3369e0d5fc", using: :btree
    t.index ["user_id"], name: "fk_rails_318345354e", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.string   "ancestry"
    t.index ["ancestry"], name: "index_users_on_ancestry", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "videos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "url"
    t.integer "play_count"
  end

  add_foreign_key "contents", "products"
  add_foreign_key "contributions", "contents"
  add_foreign_key "contributions", "products"
  add_foreign_key "contributions", "users"
  add_foreign_key "user_products", "users"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
