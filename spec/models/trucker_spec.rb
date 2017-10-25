require 'rails_helper'

RSpec.describe Trucker, type: :model do
  context 'Validade de um Trucker' do
    it 'Trucker valid?' do
      trucker = Trucker.new
      trucker.name = 'Wellison'
      trucker.phone = '(11)97722-7508'
      expect(trucker.valid?).to be_falsey
    end

    it 'Trucker valid?' do
      trucker = Trucker.new
      trucker.name = 'Wellison'
      trucker.phone = '(11)97722-7508'

      vehicle = Vehicle.new
      vehicle.vtype = 'Truck'
      vehicle.body_type = 'Sider'

      trucker.vehicle = vehicle

      expect(trucker.valid?).to be_truthy
    end
  end
end
