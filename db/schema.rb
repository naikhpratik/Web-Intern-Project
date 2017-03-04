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

ActiveRecord::Schema.define(version: 20170304183145) do

  create_table "answers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "text",        limit: 65535
    t.integer "question_id"
    t.boolean "correct"
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
  end

  create_table "ckeditor_assets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type", using: :btree
  end

  create_table "contents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "product_id"
    t.integer  "parent_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "ancestry"
    t.string   "actable_type"
    t.integer  "actable_id"
    t.string   "title"
    t.integer  "view_count"
    t.integer  "time"
    t.integer  "row_order"
    t.index ["actable_type", "actable_id"], name: "index_contents_on_actable_type_and_actable_id", using: :btree
    t.index ["ancestry"], name: "index_contents_on_ancestry", using: :btree
    t.index ["product_id"], name: "fk_rails_6f4dae6b48", using: :btree
  end

  create_table "delayed_jobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "priority",                 default: 0, null: false
    t.integer  "attempts",                 default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "flashcard_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "front",        limit: 65535
    t.text    "back",         limit: 65535
    t.integer "flashcard_id"
    t.integer "row_order"
    t.index ["flashcard_id"], name: "index_flashcard_items_on_flashcard_id", using: :btree
  end

  create_table "flashcards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
  end

  create_table "htmls", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "description"
    t.boolean "has_plain_text"
    t.text    "html_source",    limit: 65535
  end

  create_table "media", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "local_type"
    t.string  "caption"
    t.text    "transcript",    limit: 65535
    t.integer "duration"
    t.string  "thumbnail_url"
    t.string  "source"
  end

  create_table "modulees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
  end

  create_table "permissions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "role_id"
    t.text     "contents",   limit: 65535
    t.index ["product_id"], name: "index_permissions_on_product_id", using: :btree
    t.index ["role_id"], name: "index_permissions_on_role_id", using: :btree
    t.index ["user_id"], name: "index_permissions_on_user_id", using: :btree
  end

  create_table "product_asset_kinds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "description"
    t.string   "alternates"
    t.string   "kind"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "product_assets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "description"
    t.string   "uri"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "product_id"
    t.integer  "kind"
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "icon"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.string   "visibility"
    t.string   "tagline"
    t.text     "html_description", limit: 65535
    t.string   "pricing_model"
    t.integer  "frequency"
    t.decimal  "price",                          precision: 10, scale: 2
  end

  create_table "questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "hint",        limit: 65535
    t.text    "explanation", limit: 65535
    t.integer "quiz_id"
    t.index ["quiz_id"], name: "index_questions_on_quiz_id", using: :btree
  end

  create_table "quizzes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "q_type"
    t.integer "time"
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "session_id", limit: 65535,      null: false
    t.text     "data",       limit: 4294967295
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true, length: {"session_id"=>255}, using: :btree
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

  add_foreign_key "answers", "questions"
  add_foreign_key "contents", "products"
  add_foreign_key "flashcard_items", "flashcards"
  add_foreign_key "permissions", "products"
  add_foreign_key "permissions", "roles"
  add_foreign_key "permissions", "users"
  add_foreign_key "questions", "quizzes"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
