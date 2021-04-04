class Producto < ApplicationRecord
  TYPES = { mofle: "Mofle", aro: "Aro", junta: "Junta" }

  validates :nombre, :codigo, :type, presence: true
  validates :codigo, :nombre, uniqueness: { case_sensitive: false }

  belongs_to :usuario
end
