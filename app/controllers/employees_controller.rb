class EmployeesController < ApplicationController

    def new
        @employee = Employee.new
    end

    def create 
       @employee = Employee.new(employee_params)
       if @employee.save
        session[:employee_id] = @employee.id
        redirect_to @employee
       else
        render :new
       end
    end


    def show
        require_logged_in
        if 
            @employee = Employee.find_by_id(params[:id])
        else
            session.clear
            redirect_to '/login'
        end
    end


    private

    def employee_params
        params.require(:employee).permit(:username, :email, :contact_number, :password, :password_confirmation)
    end
end
