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

ActiveRecord::Schema.define(version: 2020_12_28_185344) do

  create_table "bonds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "company"
    t.date "admission"
    t.string "description"
    t.string "responsible"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colaborattors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "colaborattorname"
    t.integer "matriculation"
    t.date "admission"
    t.string "address"
    t.string "zip_code"
    t.string "homenumber"
    t.string "cellphone"
    t.string "phone"
    t.string "email"
    t.date "birthdate"
    t.string "gender"
    t.string "identify"
    t.string "cpf"
    t.string "instruction"
    t.string "professionalqualification"
    t.string "classcouncilregistration"
    t.integer "crm"
    t.integer "status"
    t.text "notes"
    t.integer "pendecy"
    t.bigint "bond_id"
    t.bigint "daily_hour_id"
    t.bigint "financial_id"
    t.bigint "function_id"
    t.bigint "schedule_id"
    t.bigint "sector_id"
    t.bigint "office_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bond_id"], name: "index_colaborattors_on_bond_id"
    t.index ["daily_hour_id"], name: "index_colaborattors_on_daily_hour_id"
    t.index ["financial_id"], name: "index_colaborattors_on_financial_id"
    t.index ["function_id"], name: "index_colaborattors_on_function_id"
    t.index ["office_id"], name: "index_colaborattors_on_office_id"
    t.index ["schedule_id"], name: "index_colaborattors_on_schedule_id"
    t.index ["sector_id"], name: "index_colaborattors_on_sector_id"
  end

  create_table "daily_hours", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "shift"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "financials", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.float "hourvalue"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "functions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "namefunction"
    t.text "assignment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parkings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "adhesive"
    t.date "stickerreceipt"
    t.bigint "cnh"
    t.string "vehicle"
    t.string "board"
    t.string "color"
    t.string "modelcar"
    t.integer "status"
    t.text "notes"
    t.bigint "sei"
    t.bigint "colaborattor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["colaborattor_id"], name: "index_parkings_on_colaborattor_id"
  end

  create_table "schedules", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "typo"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sectors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "description"
    t.string "initials"
    t.string "parentsector"
    t.bigint "colaborattor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["colaborattor_id"], name: "index_sectors_on_colaborattor_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "document"
    t.integer "role"
    t.integer "status"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "colaborattors", "bonds"
  add_foreign_key "colaborattors", "daily_hours"
  add_foreign_key "colaborattors", "financials"
  add_foreign_key "colaborattors", "functions"
  add_foreign_key "colaborattors", "offices"
  add_foreign_key "colaborattors", "schedules"
  add_foreign_key "colaborattors", "sectors"
  add_foreign_key "parkings", "colaborattors"
end
