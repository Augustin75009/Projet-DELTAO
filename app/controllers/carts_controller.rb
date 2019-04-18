class CartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :cart_not_found
  before_action :set_cart

  def index
    @carts = Cart.where(user_id:current_user.id)
    # authorize @product
  end

  def new
  end

  def show
    @cart = Cart.find(params[:id])
    @cart.price_cents = @cart.total
    @cart.save
  end


  def create
    @cart = Cart.new
    @cart.user = current_user
    # @cart.price_cents = 12
    @cart.price_cents = @cart.total
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

  private

  def cart_not_found
    redirect_to root_url, alert: t(".cart_not_found")
  end

  def cart_empty?
    content = Cart.count
    if content.nil?
      false
    else
      true
    end
  end

  def set_cart
    if user_signed_in?
      @cart_items = CartItem.where(user_id: current_user.id)
    else
      @cart_items = []
    end
  end


end
