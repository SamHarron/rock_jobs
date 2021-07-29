class LocationsController < ApplicationController
    before_action :require_logged_in


    def new
        if employee_check
            @location = @employee.locations.build
        else
            @location = Location.new
        end
    end

    def index
        if params[:employee_id] && @employee = Employee.find_by_id(params[:employee_id])
          @locations = @employee.locations
        else
          session.clear
          flash[:errors] = "No Employee Found"
          redirect_to '/signup'
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



    def edit
        find_location
    end

    def update
        find_location
        redirect_to employee_path if !@location || @location.employee != current_user
       if @location.update(location_params)
         redirect_to employee_locations_path(@location)
       else
         render :edit
       end
     end

     def show
        find_location
        redirect_to employee_locations_path if !@location
      end
 
     private
 
     def location_params
         params.require(:location).permit(:employee_id, :city, :state, :street_address, :zip_code)
     end

     def employee_check
        @employee = Employee.find_by_id(params[:employee_id])
     end

     def find_location
        @location = Location.find_by(params[:location_id])
     end

end
