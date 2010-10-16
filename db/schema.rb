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

ActiveRecord::Schema.define(:version => 20101016131835) do

  create_table "audits", :force => true do |t|
    t.string   "action"
    t.string   "auditable_type"
    t.integer  "auditable_id"
    t.string   "association_type"
    t.integer  "association_id"
    t.string   "field_name"
    t.string   "old_value"
    t.string   "new_value"
    t.boolean  "undoable",         :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "audits", ["association_type", "association_id"], :name => "index_audits_on_association_type_and_association_id"
  add_index "audits", ["auditable_type", "auditable_id"], :name => "index_audits_on_auditable_type_and_auditable_id"

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.integer  "industry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employments", :force => true do |t|
    t.integer  "company_id"
    t.integer  "person_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employments", ["company_id"], :name => "index_employments_on_company_id"
  add_index "employments", ["person_id"], :name => "index_employments_on_person_id"

  create_table "industries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phone_numbers", :force => true do |t|
    t.string   "phoneable_type"
    t.integer  "phoneable_id"
    t.string   "number"
    t.string   "extension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "phone_numbers", ["phoneable_type", "phoneable_id"], :name => "index_phone_numbers_on_phoneable_type_and_phoneable_id"

end
