class CartsController < ApplicationController

def create
    @product = Product.find(params[:product])
    @cart = Cart.new
    @cart.user = current_user
    @cart.product = @product
    authorize @cart
    @cart.save
    @counter = current_user.carts.count
    respond_to do |format|
      format.html { redirect_to products_path }
      format.js
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @cart = Cart.find_by(product_id: params[:id])
    authorize @cart
    @cart.destroy
    @counter = current_user.carts.count
    respond_to do |format|
      format.html { redirect_to products_path }
      format.js
    end
  end

  def create_show
    @product = Product.find(params[:product])
    @cart = Cart.new
    @cart.user = current_user
    @cart.product = @product
    authorize @cart
    @cart.save
    @counter = current_user.carts.count
    respond_to do |format|
      format.html { redirect_to products_path }
      format.js
    end
  end

  def destroy_show
    @product = Product.find(params[:id])
    @cart = Cart.find_by(product_id: params[:id])
    authorize @cart
    @cart.destroy
    @counter = current_user.carts.count
    respond_to do |format|
      format.html { redirect_to products_path }
      format.js
    end
  end


end
