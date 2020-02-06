class CartItemsController < ApplicationController

  def index
    if user_signed_in?
      @cart_items = CartItem.where(user_id: current_user.id)
    else
      @cart_items = []
    end
  end

  def create
    if user_signed_in?
      if is_a_product?
        # @product = Product.find(params[:product])
        # # @cart_item = @cart.cart_items.new(product: @product)
        # if cart_empty?
        #   @cart = Cart.new
        #   @cart.user = current_user
        #   @cart.price_cents = @product.price_cents
        # else
        #   @cart = Cart.last
        #   @cart.price_cents += @product.price_cents
        # end
        # @cart_item = @cart.add_product(@product)
        # @cart_item.user = current_user
        # @cart_item.cart = @cart
        # @cart_item.save
        # @cart.save
        # # @counter = current_user.cart_item_item.count
        # respond_to do |format|
        #   format.html { redirect_to products_path }
        #   format.js
        # end
      else
        @lesson = Lesson.find(params[:lesson])
        if cart_empty?
          @cart = Cart.new
          @cart.user = current_user
          @cart.price_cents = @lesson.price_cents
        else
          @cart = Cart.where(user_id: current_user.id).last
          @cart.price_cents += @lesson.price_cents
        end
        @cart_item = @cart.add_lesson(@lesson, params[:cart_item][:slot], current_user)
        @cart_item.user = current_user
        @cart_item.cart = @cart
        @cart_item.save
        @cart.save
        respond_to do |format|
          format.html { redirect_to lesson_path(@lesson) }
          format.js
        end
      end
    else
      redirect_to new_user_session_path
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    new_quantity = params[:cart_item]
    @cart_item.quantity = new_quantity[:quantity]
    @cart_item.save
    respond_to do |format|
        format.html { redirect_to cart_items_path }
        format.js
    end
  end

  def top_up
    @cart_item = CartItem.find(params[:cart_item])
    @cart_item.quantity += 1
    @cart_item.save
    respond_to do |format|
        format.html { redirect_to cart_items_path }
        format.js
    end
  end

  def top_down
    @cart_item = CartItem.find(params[:cart_item])
    @cart_item.quantity -= 1
    @cart_item.save
    respond_to do |format|
        format.html { redirect_to cart_items_path }
        format.js
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_items_path }
      format.js
    end
  end

  private

  def cart_empty?
    content = CartItem.where(user_id: current_user.id).count
    if content.zero?
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
end
