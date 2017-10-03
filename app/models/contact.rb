class Contact < ApplicationRecord
	has_many :shipments

	validates :name, :phone, presence: { message: "Obrigatorio a inclusão" }
		
	# validates :name, length: { minimum: 2,message: "Nome invalido"}
	# validates :phone, uniqueness: {message: "Numero de contato ja cadastrado"}
	# validates :phone, format: { with: /\((\d{2})\)\s+(\d{4})-(\d{4})/,
 #    message: "Formato invalido - ideal: (xx)xxxx-xxxx" }
end
