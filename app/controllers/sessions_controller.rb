class SessionsController < ApplicationController

    def new

    end

    def create 
    employee = Employee.find_by_username(params[:username])
        if employee && employee.authenticate(params[:password])
            session[:employee_id] = employee.id
            redirect_to employee
        else
            flash[:errors] = ["Invalid Login Username and/or Password, Please Try Again."]
            redirect_to '/login'
        end
    end

    def logout
        session.clear
        redirect_to new_employee_path
    end

end
