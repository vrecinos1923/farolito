class Denuncium < ApplicationRecord
	before_save :to_upper

	belongs_to :catalogo

	validates :fecha, :longitud, :latitud, :catalogo_id, presence: true
	validates :descripcion, length: { maximum: 350 }
end
