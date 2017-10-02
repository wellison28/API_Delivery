class Shipment < ApplicationRecord
  belongs_to :contact
  belongs_to :origin
  belongs_to :destination
  has_many :shipment_vehicles

  validates :value
  validates :weight_kg
end
