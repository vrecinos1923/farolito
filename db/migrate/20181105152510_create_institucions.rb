class CreateInstitucions < ActiveRecord::Migration[5.1]
  def change
    create_table :institucions do |t|
      t.string :nombre, limit:350

      t.timestamps
    end
  end
end
