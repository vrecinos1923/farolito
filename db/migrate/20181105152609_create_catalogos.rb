class CreateCatalogos < ActiveRecord::Migration[5.1]
  def change
    create_table :catalogos do |t|
      t.string :valor		,limit:50
      t.string :descripcion	,limit:150

      t.timestamps
    end
  end
end
