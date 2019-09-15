class PaymentsController < ApplicationController
  before_action :set_order, only: [:new, :create, :edit, :update]
  skip_before_action :verify_authenticity_token, only: :success_hook

  def new
    # success_url = "http://localhost:3000/charge?lkEZDDSWWsfnZLEKN=#{params[:purchase_id]}"
    success_url = "https://tessa.herokuapp.com/charge?lkEZDDSWWsfnZLEKN=#{params[:purchase_id]}"
    @cart = Cart.find(params[:cart_id])
    @cart_items = CartItem.where(user_id: current_user.id)
    if params[:gift]
      @stripe_session = Stripe::Checkout::Session.create(
        customer_email: current_user.email,
        payment_method_types: ['card'],
        line_items: [{
          images: ['https://res.cloudinary.com/dw7nokc0j/image/upload/v1566935252/b76o4z7jziipudajkxxa.jpg'],
          description: "Bon cadeau : #{Lesson.find(params[:lesson]).title}",
          name: "Montant total : ",
          amount: @cart.price_cents * 100,
          currency: 'eur',
          quantity: 1
        }],
        success_url: "#{success_url}",
        cancel_url: "#{success_url}",
        client_reference_id: "@delivery.id")
    else
      @stripe_session = Stripe::Checkout::Session.create(
        customer_email: current_user.email,
        payment_method_types: ['card'],
        line_items: [{
          images: ['https://res.cloudinary.com/dw7nokc0j/image/upload/v1566935252/b76o4z7jziipudajkxxa.jpg'],
          description: "Réservation : #{Purchase.find(params[:purchase_id]).slot}",
          name: "Montant total :",
          amount: @cart.total * 100,
          currency: 'eur',
          quantity: 1
        }],
        success_url: "#{success_url}",
        cancel_url: "#{success_url}",
        client_reference_id: "@delivery.id")
    end
#     rescue Stripe::CardError => e
#      flash[:alert] = e.message
#      redirect_to new_cart_purchase_payment_path(@purchase)
  end

  def show
  end

  def charge
    @cart_items = CartItem.where(user_id: current_user.id)
    Purchase.find(params[:lkEZDDSWWsfnZLEKN]).update(state: 'paid')
    @cart_items.destroy_all
    # raise
    redirect_to root_path(paid: true)
  end

  def create
  end

private

  def set_order
    @cart_items = CartItem.where(user_id: current_user.id)
    @cart = Cart.where(user_id: current_user.id)
    @purchase = current_user.purchases.where(state: 'checking').find(params[:purchase_id]) # verifier pourquoi c'est pas pending comme dans le cours
  end
end
