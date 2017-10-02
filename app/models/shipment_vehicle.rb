class ShipmentVehicle < ApplicationRecord
  belongs_to :shipment

  validates :body_type, :vtype, presence: { message: "Obrigatorio a inclusão" }
end
