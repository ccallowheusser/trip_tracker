class AddressesController < ApplicationController
  before_action :set_address, except: [:index, :new, :create]

  def index
  	@addresses = Address.all
  end

  def show
  end

  def new
  	@addresses = Address.new
  end

  def edit
  end

  def create
  	@address = Address.new(address_params)

  	if @address.save
  		redirect_to @address
  	else
  		render :new
  	end
  end

  def update
    if @address.update(address_params)
      redirect_to addresses_path
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to address_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def address_params
      params.require(:address).permit(:siteName)
    end

end
