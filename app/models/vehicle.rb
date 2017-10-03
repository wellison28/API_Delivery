class Vehicle < ApplicationRecord
	has_many :truckers

	validates :vtype, :body_type, presence: { message: "Obrigatorio a inclusão" }
end
