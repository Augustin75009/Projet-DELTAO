class PurchasesController < ApplicationController
  def new
    @purchase = Purchase.new
    # authorize @purchase
  end

  def show
    @purchase = current_user.purchases.where(state: 'paid').find(params[:id])
  end

  def index
    if is_admin?
      @cart_items = CartItem.all
      @lessons = Lesson.all
      @users = User.all
      @cart = Cart.all
      # @purchases = Purchase.where(state: 'paid')
      @purchases = Purchase.all
      # raise
    else
      redirect_to root_path
    end
  end

  def create
    @purchase = Purchase.new
    @cart = Cart.find(params[:cart_id])
    set_user_infos
    @purchase.product_sku = @cart.id
    @purchase.user = current_user
    @purchase.state = 'checking'
    @purchase.amount_cents = @cart.price_cents
    @purchase.slot = []
    # @purchase.slot = CartIt.where(cart_id: @purchases.last.product_sku).last.slot
    CartItem.where(cart_id: @cart.id).each do |t|
      @purchase.slot << "#{t.slot}-#{Lesson.find(t.lesson_id).title}"
    end
    # raise
    # authorize @purchase
    if @purchase.save!
      redirect_to new_cart_purchase_payment_path(purchase_id: @purchase.id)
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

  private

  def set_user_infos
    @user = User.find(@cart.user.id)
    @user.phone = params[:phone]
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.address = params[:address]
    @user.zip = params[:zip]
    @user.email = params[:email]
    @user.city = params[:city]
    @user.save
  end

  def is_admin?
    return current_user.adminkey == "admin"
  end
end
