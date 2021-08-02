class MeasurementsController < ApplicationController
  before_action :require_logged_in
  before_action :set_measurement, only: [:edit, :update, :destroy]

  
  def index
    if set_location
      @measurements = @location.measurements.latest_date
    else
      flash[:errors] = "That Location Does Not Exist" if !params[:location_id]
      redirect_to employee_locations_path(current_user)
    end
  end

  def new
    if set_location
      @measurement = @location.measurements.build
    else
      flash[:errors] = "That Location Does Not Exist" if !params[:location_id]
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
      flash[:errors] = "Unable to Update. Please Try Agian."
      redirect_to edit_location_measurement_path(@measurement)
    end
  end

  def destroy
    @measurement.destroy

    redirect_to employee_locations_path(current_user)
  end

  private

  def measurement_params
    params.require(:measurement).permit(:location_id, :length, :width, :date)
  end

  def set_measurement
    @measurement = Measurement.find_by_id(params[:id])
    if !@measurement
      flash[:errors] = "Measurement was not found"
      redirect_to employee_path(current_user)
    end
  end

  def set_location
    params[:location_id] && @location = Location.find_by_id(params[:location_id])
  end
end
