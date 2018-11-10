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

ActiveRecord::Schema.define(version: 20181108042825) do

  create_table "autores", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "nacionalidad_id"
    t.string "nombre", limit: 50
    t.string "apellido", limit: 50
    t.date "fechanacimiento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nacionalidad_id"], name: "index_autores_on_nacionalidad_id"
  end

  create_table "catalogos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "valor", limit: 50
    t.string "descripcion", limit: 150
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "denuncia", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "fecha"
    t.string "descripcion", limit: 500
    t.decimal "longitud", precision: 15, scale: 10
    t.decimal "latitud", precision: 15, scale: 10
    t.string "estado", limit: 3
    t.bigint "catalogo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["catalogo_id"], name: "index_denuncia_on_catalogo_id"
  end

  create_table "institucioncatalogos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "catalogo_id"
    t.bigint "institucion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["catalogo_id"], name: "index_institucioncatalogos_on_catalogo_id"
    t.index ["institucion_id"], name: "index_institucioncatalogos_on_institucion_id"
  end

  create_table "institucions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre", limit: 350
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "abreviatura"
    t.string "direccion"
  end

  create_table "libros", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "autor_id"
    t.string "titulo", limit: 50
    t.string "isbn", limit: 50
    t.decimal "precio", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["autor_id"], name: "index_libros_on_autor_id"
  end

  create_table "nacionalidades", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "pais", limit: 3
    t.string "descripcion", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "old_passwords", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "encrypted_password", null: false
    t.string "password_archivable_type", null: false
    t.integer "password_archivable_id", null: false
    t.string "password_salt"
    t.datetime "created_at"
    t.index ["password_archivable_type", "password_archivable_id"], name: "index_password_archivable"
  end

  create_table "usuarios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "password_changed_at"
    t.string "unique_session_id", limit: 20
    t.datetime "last_activity_at"
    t.datetime "expired_at"
    t.string "rol"
    t.bigint "institucion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_usuarios_on_confirmation_token", unique: true
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["expired_at"], name: "index_usuarios_on_expired_at"
    t.index ["institucion_id"], name: "index_usuarios_on_institucion_id"
    t.index ["last_activity_at"], name: "index_usuarios_on_last_activity_at"
    t.index ["password_changed_at"], name: "index_usuarios_on_password_changed_at"
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "autores", "nacionalidades", column: "nacionalidad_id"
  add_foreign_key "denuncia", "catalogos"
  add_foreign_key "institucioncatalogos", "catalogos"
  add_foreign_key "institucioncatalogos", "institucions"
  add_foreign_key "libros", "autores", column: "autor_id"
  add_foreign_key "usuarios", "institucions"
end
