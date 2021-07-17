class SessionsController < ApplicationController

def logout
    session.clear
    redirect_to new_employee_path
end

def login
end

def create 
end

end
