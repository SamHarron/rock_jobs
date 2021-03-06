class LocationsController < ApplicationController
    before_action :require_logged_in
    before_action :find_location, only: [:edit, :update, :show, :destroy]
    before_action :redirect_if_not_auth, only: [:edit, :update, :destroy]

    def new
        if employee_check
            @location = @employee.locations.build
        else
            @location = Location.new
        end
    end

    def index
      if params[:employee_id] && @employee = Employee.find_by_id(params[:employee_id])
        @locations = @employee.locations.alpha
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
    end

    def update
       if @location.update(location_params)
         redirect_to employee_locations_path(@location.employee)
       else
         render :edit
       end
     end

     def show
        redirect_to employee_locations_path if !@location
      end

      def destroy
        @location.destroy
    
        redirect_to employee_path(current_user)
      end
 
     private
 
     def location_params
         params.require(:location).permit(:employee_id, :city, :state, :street_address, :zip_code)
     end

     def employee_check
        @employee = Employee.find_by_id(params[:employee_id])
     end

     def find_location
        @location = Location.find_by_id(params[:id])
     end

     def redirect_if_not_auth
        redirect_to employee_path(current_user) if !@location || @location.employee != current_user
     end

end
