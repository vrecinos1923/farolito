class Institucioncatalogo < ApplicationRecord
	belongs_to :catalogo
	belongs_to :institucion

	validates_uniqueness_of :catalogo_id, scope: :institucion_id
end
