
module Api
	class TruckersController < ApplicationController
		
	  def create   
	  	vehicle = trucker_params[:vehicle]

	    @vehicle = Vehicle.new(vtype: vehicle[:type],
	    					   body_type: vehicle[:body_type])
	    if @vehicle.save
			@trucker = Trucker.new(name: trucker_params[:name], 
								   phone: trucker_params[:phone],
								   vehicle: @vehicle)
			if @trucker.save
				render status: :created, 
				location: [:api, @trucker], 
				content_type: "application/json"
			else
				@vehicle.destroy
				render json: @trucker.errors, status: :unprocessable_entity
			end	      
	    else
	      render json: @vehicle.errors, status: :unprocessable_entity
	    end
	  end

	  	def trucker_params
	  		params.require(:trucker).permit!
		end

		def last_location
			@trucker = Trucker.find(params[:id])
			location = params.require(:location).permit(:city, :state)
			@trucker.last_city = location[:city]
			@trucker.last_state = location[:state]
			if @trucker.save
				render status: 204
			else
				@vehicle.destroy
				render json: @trucker.errors, status: :unprocessable_entity
			end
		end
	end
end
