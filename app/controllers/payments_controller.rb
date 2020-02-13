class PaymentsController < ApplicationController
  before_action :set_order, only: [:new, :create, :edit, :update]
  skip_before_action :verify_authenticity_token, only: :success_hook

  def new
    success_url = "http://localhost:3000/charge?lkEZDDSWWsfnZLEKN=#{params[:purchase_id]}"
    # success_url = "https://www.delaterrealobjet.fr/charge?lkEZDDSWWsfnZLEKN=#{params[:purchase_id]}"
    cancel_url = "http://localhost:3000/"
    # cancel_url = "https://www.delaterrealobjet.fr/"
    begin
    @cart = Cart.find(params[:cart_id])
    @cart_items = CartItem.where(user_id: current_user.id)
    if params[:gift]
      @stripe_session = Stripe::Checkout::Session.create(
        customer_email: current_user.email,
        payment_method_types: ['card'],
        line_items: [{
          images: ['https://res.cloudinary.com/dw7nokc0j/image/upload/v1560937414/Bon_cadeau.jpg'],
          description: "Bon cadeau : #{Lesson.find(params[:lesson]).title}",
          name: "Montant total : ",
          amount: @cart.price_cents * 100,
          currency: 'eur',
          quantity: 1
        }],
        success_url: "#{success_url}",
        cancel_url: "#{cancel_url}",
        client_reference_id: "@delivery.id",
        payment_intent_data: {
          description: "Bon cadeau : #{Lesson.find(@cart.gift).title}",
          receipt_email: current_user.email
        },
        locale: 'fr'
      )
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
        cancel_url: "#{cancel_url}",
        client_reference_id: "@delivery.id",
        payment_intent_data: {
          description: "Réservation atelier : #{Purchase.find(params[:purchase_id]).slot}",
          receipt_email: current_user.email
        },
        locale: 'fr'
      )
    end
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_cart_purchase_payment_path(@purchase)
   end
  end

  def show
  end

  def charge
    @cart_items = CartItem.where(user_id: current_user.id)
    Purchase.find(params[:lkEZDDSWWsfnZLEKN]).update(state: 'paid')
    update_quantity
    @cart_items.destroy_all
    redirect_to root_path(paid: true)
  end

  def create
  end

  private

  def update_quantity
    @cart_items.each do |item|
      cart_quantity = item.quantity
      slot = Slot.find(item.slot_id)
      slot.update(quantity: slot.quantity - cart_quantity)
    end
  end

  def set_order
    @cart_items = CartItem.where(user_id: current_user.id)
    @cart = Cart.where(user_id: current_user.id)
    @purchase = current_user.purchases.where(state: 'checking').find(params[:purchase_id]) # verifier pourquoi c'est pas pending comme dans le cours
  end
end
