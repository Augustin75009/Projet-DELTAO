class CartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :cart_not_found
  before_action :set_cart

  def index
    @carts = Cart.where(user_id: current_user.id)
    # authorize @product
  end

  def new
    @cart = Cart.new
    @cart.user = current_user
    @cart.price_cents = Lesson.find(params[:lesson]).total.to_i
    @cart.gift = params[:lesson]
    # authorize @cart
    @cart.save
    if user_signed_in?
      respond_to do |format|
        format.html { redirect_to cart_path(@cart, gift: true, lesson: params[:lesson]) }
        format.js
      end
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @cart = Cart.find(params[:id])
    @cart.save
  end

  def create
    @cart = Cart.new
    @cart.user = current_user
    @cart.price_cents = @cart.total
    # authorize @cart
    @cart.save
    respond_to do |format|
      format.html { redirect_to carts_path }
      format.js
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    # authorize @cart
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_path }
      format.js
    end
  end

  private

  def cart_not_found
    redirect_to root_url, alert: t(".cart_not_found")
  end

  private

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
      if params[:gift].present?
        @cart_items = []
      else
        @cart_items = CartItem.where(user_id: current_user.id)
      end
    else
      @cart_items = []
    end
  end
end
