class LocationsController < ApplicationController
  before_action :set_trip, except: [:update, :edit, :index, :show, :destroy]
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  #before_action :set_address
 
  def index
  	@locations = Location.all
  end

  def show
  end

  def new
  	@location = Location.new
  end

  def edit
  end

def create
      @location = @trip.locations.new(location_params)

    if @location.save
      redirect_to trip_locations_path(@trip)
    else
      render :new
    end
  end

  def update
    if @location.update(location_params)
      redirect_to locations_path
    else
      render :edit
    end
  end


  def destroy
    @location.destroy
    redirect_to locations_path
  end

  # def new_address
  #   @addresses = Address.all.where(location_id: nil)
  # end

  # def add_address
  #   @location.addresses << Address.find(params[:address_id])
  #   redirect_to address_path(@address)
  # end

  # def remove_address
  #   Address.find(params[:address_id]).update(location_id: nil)
  #   redirect_to location_path(@location)
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      if @trip
        @location = @trip.locations.find(params['id'])
      else
        @location = Location.find(params['id'])
      end
    end

    def set_trip
       @trip = Trip.find(params['trip_id'])
       if @trip == nil
          @trip = Trip.find(params['id'])
       end 
     end

    #def set_address
      #@address = Address.find(params[:address_id])
    #end

    # Only allow a trusted parameter "white list" through.
    def location_params
      params.require(:location).permit(:locationName, :arriveDate, :arriveTime, :duration, :milesSinceLast, :purpose)
    end

end
