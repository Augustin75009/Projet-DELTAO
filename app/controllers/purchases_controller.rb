class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  def index
    @purchases = Purchase.all
  end

  def show
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.save
    redirect_to purchase_path(@purchase)
  end

  def edit
  end

  def update
    @purchase.update(purchase_params)
    redirect_to purchase_path(@purchase)
  end

  def destroy
    @purchase.destroy
    redirect_to purchases_path
  end

  private

  def purchase_params
    params.require(:purchase).permit(:product_id)
  end


  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

end
