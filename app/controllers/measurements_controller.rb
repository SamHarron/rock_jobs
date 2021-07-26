class MeasurementsController < ApplicationController
  before_action :require_logged_in

  
  def index
    if found_measurement?
      @measurements = @location.measurements
    else
      flash[:errors] = ["That Location Does Not Exist"] if params[:location_id]
      redirect_to locations_path
    end
  end

  def new
    if found_measurement?
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
    find_measurement
  end

  def update
    find_measurement
      redirect_to employee_path if !@measurement || @measurement.employee != current_user
     if @measurement.update(measurement_params)
     redirect_to measurements_path
     else
     render :edit
     end
  end

  private

  def measurement_params
    params.require(:measurement).permit(:location_id, :length, :width, :date)
  end

  def found_measurement?
    params[:location_id] && @location = Location.find_by_id(params[:location_id])
  end

  def find_measurement
    @measurement = Measurement.find_by_id(params[:id])
  end
end
