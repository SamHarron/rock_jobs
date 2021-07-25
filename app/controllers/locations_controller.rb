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
            redirect_to employee_locations_path(current_user)
        else
            render :new
        end
    end 

    def index
        if params[:employee_id] && @employee = Employee.find_by_id(params[:employee_id])
          @locations = @employee.locations
        else
          flash[:errors] = ["Employee Not Found"] if params[:employee_id]
          redirect_to signup_path
        end
    end
 
     private
 
     def location_params
         params.require(:location).permit(:employee_id, :city, :state, :street_address, :zip_code)
     end


end
