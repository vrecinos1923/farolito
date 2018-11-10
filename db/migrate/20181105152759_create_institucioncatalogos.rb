class CreateInstitucioncatalogos < ActiveRecord::Migration[5.1]
  def change
    create_table :institucioncatalogos do |t|
      t.references :catalogo 	, index: true, foreign_key: true
      t.references :institucion 	, index: true, foreign_key: true

      t.timestamps
    end
  end
end
