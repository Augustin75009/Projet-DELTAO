class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @products = Product.search_by_name_and_category(params[:query])
    else
      @products = Product.all
    end
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to product_path(@product)
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price_cents, :photo, :quantity)
  end


  def set_product
    @product = Product.find(params[:id])
  end

end
