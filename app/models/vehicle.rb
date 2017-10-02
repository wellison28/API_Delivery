class Vehicle < ApplicationRecord
	has_many :truckers
	
	validates_associated :truckers

	validates :vtype, :body_type, presence: { message: "Obrigatorio a inclusão" }
end
