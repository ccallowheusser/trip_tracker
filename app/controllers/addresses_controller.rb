class AddressesController < ApplicationController
  before_action :set_location, except: [:update, :edit, :index, :show, :destroy]
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  #before_action :set_address
 
  def index
    @addresses = Address.all
  end

  def show
  end

  def new
    @address = Address.new
  end

  def edit
  end

def create
      @address = @location.address.new(address_params)

    if @address.save
      redirect_to locations_path
    else
      render :new
    end
  end

  def update
    if @address.update(address_params)
      redirect_to locations_path
    else
      render :edit
    end
  end


  def destroy
    @address.destroy
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
    def set_address
      if @location
        @address = @locations.find(params['id'])
      else
        @address = Address.find(params['id'])
      end
    end


    def set_location
      @location = Location.find(params['location_id'])
    end

    # Only allow a trusted parameter "white list" through.
    def address_params
      params.require(:address).permit(:siteName, :streetAddress, :city, :state, :zip5)
    end

end
