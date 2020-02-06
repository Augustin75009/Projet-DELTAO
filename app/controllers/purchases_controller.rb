class PurchasesController < ApplicationController
  def new
    @purchase = Purchase.new
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
      @purchases = Purchase.where(state: 'paid')
    else
      redirect_to root_path
    end
  end

  def create
    @purchase = Purchase.new
    @cart = Cart.find(params[:cart_id])
    set_user_infos
    @purchase.product_sku = @cart.id
    @purchase.user = @user
    @purchase.state = 'checking'

    if params[:gift]
      @purchase.amount_cents = @cart.price_cents
    else
      @purchase.amount_cents = @cart.total
    end
    @purchase.slot = []
    CartItem.where(cart_id: @cart.id).each do |t|
      @purchase.slot << "#{t.slot} - #{Lesson.find(t.lesson_id).title} x#{t.quantity}"
    end
    if @purchase.save! && provided_phone
      if params[:gift]

        redirect_to new_cart_purchase_payment_path(gift: true, purchase_id: @purchase.id, lesson: params[:slot])
      else
        redirect_to new_cart_purchase_payment_path(purchase_id: @purchase.id)
      end
    else
      @cart_items = CartItem.where(user: current_user)
      if params[:gift]
        redirect_to cart_path(gift: true, id: params[:cart_id], lesson: params[:slot]), alert: "N° de téléphone invalide"
      else
        redirect_to cart_path(id: params[:cart_id]), alert: "N° de téléphone invalide"
      end
    end
  end

  def edit
  end

  def update
    @purchase = Purchase.find_by(cart_id: params[:cart_id], user_id: params[:id])
    if params[:status] == 'checking'
      @purchase.status = 'contact'
      @purchase.save
      redirect_to myproducts_path
    elsif params[:status] == 'contact'
      @purchase.status = 'approved'
      @purchase.save
      redirect_to myproducts_path
    elsif params[:status] == 'paid'
      @purchase.status = 'done'
      @purchase.save
      redirect_to status_path
    end
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy
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

  def provided_phone
    return @purchase.user.phone.class != NilClass && @purchase.user.phone != ""
  end
end
