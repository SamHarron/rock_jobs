class EmployeesController < ApplicationController

    def new
        @employee = Employee.new
    end

    def create 
       @employee = Employee.create(employee_params)
       if @employee.save
        session[:employee_id] = @employee.id
        render :home
       else
        render :new
       end
    end

    private

    def employee_params
        params.require(:employee).permit(:username, :email, :password, :password_confirmation)
    end
end
