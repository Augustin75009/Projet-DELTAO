class CartItemsController < ApplicationController

  def index
    @cart_items = Cart_item.where(user_id:current_user.id)
    # authorize @product
  end


  def create
    @product = Product.find(params[:product])
    @cart_item = Cart_item.new
    @cart_item.user = current_user
    @cart_item.product = @product
    # authorize @cart_item
    @cart_item.save
    # @counter = current_user.cart_item_item.count
    respond_to do |format|
      format.html { redirect_to products_path }
      format.js
    end
  end

  def destroy
    @cart_item = Cart_item.find(params[:id])
    # authorize @cart_item
    @cart_item.destroy
    # @counter = current_user.cart_item_item.count
    respond_to do |format|
      format.html { redirect_to cart_item_item_path }
      format.js
    end
  end

  # def create_show
  #   @product = Product.find(params[:product])
  #   @cart_item = Cart_item.new
  #   @cart_item.user = current_user
  #   @cart_item.product = @product
  #   authorize @cart_item
  #   @cart_item.save
  #   @counter = current_user.cart_item_item.count
  #   respond_to do |format|
  #     format.html { redirect_to products_path }
  #     format.js
  #   end
  # end

  # def destroy_show
  #   @product = Product.find(params[:id])
  #   @cart_item = Cart_item.find_by(product_id: params[:id])
  #   authorize @cart_item
  #   @cart_item.destroy
  #   @counter = current_user.cart_item_item.count
  #   respond_to do |format|
  #     format.html { redirect_to products_path }
  #     format.js
  #   end
  # end

  private

end
