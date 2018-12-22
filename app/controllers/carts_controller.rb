class CartsController < ApplicationController

  def index
    @carts = Cart.where(user_id:current_user.id)
    # authorize @product
  end

  def new
  end


  def create
    @cart = Cart.new
    @cart.user = current_user
    @cart.price_cents = 12
    # @cart.product = @product
    # authorize @cart
    @cart.save
    # @counter = current_user.carts.count
    respond_to do |format|
      format.html { redirect_to carts_path }
      format.js
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    # authorize @cart
    @cart.destroy
    # @counter = current_user.carts.count
    respond_to do |format|
      format.html { redirect_to carts_path }
      format.js
    end
  end

  # def create_show
  #   @product = Product.find(params[:product])
  #   @cart = Cart.new
  #   @cart.user = current_user
  #   @cart.product = @product
  #   authorize @cart
  #   @cart.save
  #   @counter = current_user.carts.count
  #   respond_to do |format|
  #     format.html { redirect_to products_path }
  #     format.js
  #   end
  # end

  # def destroy_show
  #   @product = Product.find(params[:id])
  #   @cart = Cart.find_by(product_id: params[:id])
  #   authorize @cart
  #   @cart.destroy
  #   @counter = current_user.carts.count
  #   respond_to do |format|
  #     format.html { redirect_to products_path }
  #     format.js
  #   end
  # end

  private

  def cart_empty?
    content = Cart.count
    if content.nil?
      false
    else
      true
    end
  end


end
