class TeachingsController < ApplicationController
  before_action :set_teaching, only: [:show, :edit, :update, :destroy]

  def index
    @teachings = Teaching.all
    @cart_items = CartItem.all
  end

  def new
    @teaching = Teaching.new
    @cart_items = CartItem.all
  end

  def create
    @teaching = Teaching.new(teaching_params)
    @teaching.save
    redirect_to teachings_path
  end

  def update
    @teaching.update(teaching_params)
    redirect_to teachings_path
  end

  def destroy
    @teaching.destroy
    redirect_to :root
  end

  private

  def teaching_params
    params.require(:teaching).permit(:title, :content, :header)
  end

  def set_teaching
    @teaching = Teaching.find(params[:id])
    @cart_items = CartItem.all
  end
end
