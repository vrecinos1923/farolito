class AddAbreviaturaDireccion < ActiveRecord::Migration[5.1]
  def change
  	add_column :institucions, :abreviatura, :string
  	add_column :institucions, :direccion, :string
  end
end
