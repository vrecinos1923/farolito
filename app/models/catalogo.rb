class Catalogo < ApplicationRecord
	before_save :to_upper

	has_many :denunciums
	has_many :institucioncatalogos

	validates :valor, :descripcion, presence: true
	validates :valor, uniqueness: true 
	validates :valor, length: { maximum: 50 }
	validates :descripcion, length: { maximum: 150 }
end
