
module Api
class TruckersController < ApplicationController
	
	def create
		trucker = params.require(:trucker).permit(:name, :phone, {vehicle: [:type, :body_type]})
		vehicle = trucker[:vehicle]

		resp = Vehicle.find_by(vtype: vehicle[:type], body_type: vehicle[:body_type])
		if resp		
			id = resp.id
			p "Usou o velho"
		else
			novo = Vehicle.new(vtype: vehicle[:type], body_type: vehicle[:body_type])
			novo.save
			id = novo.id

			p "Criou novo"
		end

		trucker[:vehicle] = resp
		
		@trucker = Trucker.new(trucker)

	    if @trucker.save
	      render status: :created#, location: @trucker, content_type: "application/json"
	    else
	      render json: @trucker.errors, status: :unprocessable_entity
	    end
	end

	def last_location
		trucker = Trucker.find(params[:id])
		location = params.require(:location).permit(:city, :state)
		trucker.last_city = location[:city]
		trucker.last_state = location[:state]
		trucker.save
	end

	def index
		@trucker = Trucker.all
		render json: @trucker
	end
end
end
