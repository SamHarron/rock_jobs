class MeasurementsController < ApplicationController
  before_action :require_logged_in
  before_action :set_measurement, only: [:edit, :update]
  before_action :redirect_if_not_employee, only: [:edit, :update]

  
  def index
    if params[:location_id] && @location = Location.find_by(params[:location_id])
      @measurements = @location.measurements
    else
      flash[:errors] = ["That Location Does Not Exist"] if params[:location_id]
      redirect_to employee_locations_path(current_user)
    end
  end

  def new
    if params[:location_id] && @location = Location.find_by(params[:location_id])
      @measurement = @location.measurements.build
    else
      flash[:errors] = ["That Location Does Not Exist"] if params[:location_id]
      @measurement = Measurement.new
    end
  end

  def create
    @measurement = current_user.measurements.build(measurement_params)
    if @measurement.save
      redirect_to employee_locations_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @measurement.update(measurement_params)
      redirect_to location_measurements_path(@measurement)
    else
      render :edit
    end
  end

  private

  def measurement_params
    params.require(:measurement).permit(:location_id, :length, :width, :date)
  end

  def set_measurement
    @measurement = Measurement.find_by(id: params[:id])
    if !@measurement
      flash[:message] = "Measurement was not found"
      redirect_to employee_path(current_user)
    end
  end

  def redirect_if_not_employee
    redirect_to login_path if @measurement.employee != current_user
 end
end
