class Shipment < ApplicationRecord
  belongs_to :contact
  belongs_to :origin
  belongs_to :destination
  has_many :shipment_vehicles

  validates :value, :weight_kg, :contact_id, :origin_id, :destination_id, presence: { message: "Obrigatorio a inclusão" }

  # validates :value
  # validates :weight_kg
end
