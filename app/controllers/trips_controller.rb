class TripsController < ApplicationController
  before_action :set_trip, except: [:index, :new, :create]
  # before_action :set_location, only: [:show]

  def index
  	@trips = Trip.all
  end

  def show
    @location = @trip.locations
  end

  def new
  	@trip = Trip.new
  end

  def edit
  end

  def create
  	@trip = Trip.new(trip_params)

  	if @trip.save
  		redirect_to @trip
  	else
  		render :new
  	end
  end

  # PATCH/PUT /trips/1
  def update
    if @trip.update(trip_params)
      redirect_to trips_path
    else
      render :edit
    end
  end

  def destroy
    @trip.destroy
    redirect_to trip_path
  end

  def new_location
     @locations = Location.all.where(trip_id: nil)
  end

  def add_location
    @trip.locations << Location.new
    redirect_to trip_path(@trip)
  end

  def remove_location
     Location.find(params['id']).update(trip_id: nil)
    redirect_to trip_path(@trip)
  end

  def new_receipt
     @receipts = Receipt.all.where(trip_id: nil)
  end

  def add_receipt
    @trip.receipts << Receipt.find(params['id'])
    redirect_to trip_path(@trip)
  end

  def remove_receipt
     Location.find(params['id']).update(trip_id: nil)
    redirect_to trip_path(@trip)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params['id'])
    end

    #def set_location
    #  @location = Location.find(params[:id])
    #end

    #def set_receipt
    #  @receipt = Receipt.find(params[:id])
    #end

    # Only allow a trusted parameter "white list" through.
    def trip_params
      params.require(:trip).permit(:name, :travelers, :departDate, :departTime, :returnDate, :returnTime, :numNights)
    end

end
