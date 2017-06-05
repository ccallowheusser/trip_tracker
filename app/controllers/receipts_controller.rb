class ReceiptsController < ApplicationController
  before_action :set_receipt, except: [:index, :new, :create]

  def index
  	@receipts = Receipt.all
  end

  def show
  end

  def new
  	@receipts = Receipt.new
  end

  def edit
  end

  def create
  	@receipt = Receipt.new(receipt_params)

  	if @receipt.save
  		redirect_to @receipt
  	else
  		render :new
  	end
  end

  def update
    if @receipt.update(receipt_params)
      redirect_to receipts_path
    else
      render :edit
    end
  end

  def destroy
    @receipt.destroy
    redirect_to receipt_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt
      @receipt = Receipt.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def receipt_params
      params.require(:receipt).permit(:payee)
    end


end
