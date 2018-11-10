class Institucion < ApplicationRecord
	before_save :to_upper

	has_many :usuarios
	has_many :institucioncatalogos

	validates :nombre, :abreviatura, :direccion, presence: true
	validates :nombre, uniqueness: true 
	validates :nombre, length: { maximum: 350 }
end
