class PurchasesController < ApplicationController
  def new
    @purchase = Purchase.new
    # authorize @purchase
  end

  def index
    @purchase = Purchase.all
  end

  def create
    @purchase = Purchase.new
    @cart = Cart.find(params[:id])
    @purchase.cart = @cart
    @purchase.user = current_user
    @purchase.status = 'checking'
    # authorize @purchase
    if @purchase.save!
      redirect_to cart_path(@cart)
    else
      render :new
    end
    # authorize @purchase
  end

  def edit
    # authorize @purchase
  end

  def update
    @purchase= Purchase.find_by(cart_id: params[:cart_id], user_id: params[:id])
    if params[:status] == 'checking'
      @purchase.status = 'contact'
      @purchase.save
      # authorize @purchase
      redirect_to myproducts_path
    elsif params[:status] == 'contact'
      @purchase.status = 'approved'
      @purchase.save
      # authorize @purchase
      redirect_to myproducts_path
    elsif params[:status] == 'paid'
      @purchase.status = 'done'
      @purchase.save
      # authorize @purchase
      redirect_to status_path
    end
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy
    # authorize @purchase
    redirect_to product_path(@product)
  end
end
