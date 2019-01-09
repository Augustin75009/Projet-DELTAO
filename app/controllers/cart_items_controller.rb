class CartItemsController < ApplicationController
  # include CurrentCart
  # before_action :set_cart, only: [:create]

  def index
    @cart_items = CartItem.where(user_id:current_user.id)
    # authorize @product
  end

  def create
    if is_a_product?
      @product = Product.find(params[:product])
      # @cart_item = @cart.cart_items.new(product: @product)
      if cart_empty?
        @cart = Cart.new
        @cart.user = current_user
        @cart.price_cents = @product.price_cents
      else
        @cart = Cart.last
        @cart.price_cents += @product.price_cents
      end
      @cart_item = @cart.add_product(@product)
      @cart_item.user = current_user
      @cart_item.cart = @cart
      @cart_item.save
      @cart.save
      # @counter = current_user.cart_item_item.count
      respond_to do |format|
        format.html { redirect_to products_path }
        format.js
      end
    else
      @lesson = Lesson.find(params[:lesson])
      # @cart_item = @cart.cart_items.new(lesson: @lesson)
      if cart_empty?
        @cart = Cart.new
        @cart.user = current_user
        @cart.price_cents = @lesson.price_cents
      else
        @cart = Cart.last
        @cart.price_cents += @lesson.price_cents
      end
      # raise
      @cart_item = @cart.add_lesson(@lesson)
      @cart_item.user = current_user
      @cart_item.cart = @cart
      @cart_item.save
      @cart.save
      # raise
      # @counter = current_user.cart_item_item.count
      respond_to do |format|
        format.html { redirect_to lessons_path }
        format.js
      end
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    new_quantity = params[:cart_item]
    @cart_item.quantity = new_quantity[:quantity]
    @cart_item.save
    # redirect_to root_path
    respond_to do |format|
        format.html { redirect_to cart_items_path }
        format.js
      end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    # authorize @cart_item
    @cart_item.destroy
    # @counter = current_user.cart_item_item.count
    respond_to do |format|
      format.html { redirect_to cart_items_path }
      format.js
    end
  end

  private

  def cart_empty?
    content = CartItem.count
    if content == 0
      true
    else
      false
    end
  end

  def is_a_product?
    if params[:product]
      true
    else
      false
    end
  end

  #  def cart_item_filter
  #   @user_orders = CartItem.where(user_id: current_user.user_id)
  # end

end