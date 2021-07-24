class LocationsController < ApplicationController
    before_action :require_logged_in


    def new
        if params[:employee_id] && @employee = Employee.find_by_id(params[:employee_id])
            @location = @employee.locations.build
        else
            @location = Location.new
        end
    end

    def create 
        @location = current_user.locations.build(location_params)
        if @location.save
            redirect_to employee_location_path
        else
            render :new
        end
    end 
 
     private
 
     def location_params
         params.require(:location).permit(:employee_id, :city, :state, :street_address, :zip_code)
     end


end
