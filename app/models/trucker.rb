class Trucker < ApplicationRecord
  belongs_to :vehicle
  
  validates :name, :phone, :vehicle_id, presence: { message: "Obrigatorio a inclusão" }
  
  # validates :phone, format: { with: /\((\d{2})\)(\d{4})-(\d{4})/,
  #   message: "Formato invalido - ideal: (xx)xxxx-xxxx" }
  # validates :name, length: { minimum: 2,message: "Nome invalido"}
end