class CreateDenuncia < ActiveRecord::Migration[5.1]
  def change
    create_table :denuncia do |t|
      t.datetime :fecha
      t.string :descripcion , limit:500
      t.decimal :longitud   , precision: 15, scale: 10
      t.decimal :latitud    , precision: 15, scale: 10
      t.string :estado      , limit:3
      t.references :catalogo , index: true, foreign_key: true

      t.timestamps
    end
  end
end
