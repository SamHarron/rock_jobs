class LocationsController < ApplicationController
    before_action :require_logged_in


    def new
        @location = Location.new
    end

    def create 
        @location = Location.new(location_params)
        if @location.save
         redirect_to locations_path
        else
         render :new
        end
    end 
 
     private
 
     def location_params
         params.require(:location).permit(:employee_id, :city, :state, :street_address, :zip_code)
     end


end
