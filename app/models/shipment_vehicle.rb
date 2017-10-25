class ShipmentVehicle < ApplicationRecord
  belongs_to :shipment, dependent: :destroy
  belongs_to :vehicle

  validates :vehicle_id, :shipment_id, presence: { message: 'Obrigatorio a inclusão' }
end
