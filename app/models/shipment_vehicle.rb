class ShipmentVehicle < ApplicationRecord
  belongs_to :shipment

  validates :body_type, :vtype, :shipment_id, presence: { message: "Obrigatorio a inclusão" }
end
