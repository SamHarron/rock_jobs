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
        find_employee
        redirect_to '/signup' if !@employee
    end

    def edit
        find_employee
    end

    def update
        find_employee
       if @employee.update(employee_params)
         redirect_to employee_path(@employee)
       else
         render :edit
       end
     end


    private

    def employee_params
        params.require(:employee).permit(:username, :email, :contact_number, :password, :password_confirmation)
    end

    def find_employee
        @employee = Employee.find_by_id(params[:id])
    end
end
