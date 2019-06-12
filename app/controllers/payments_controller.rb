class PaymentsController < ApplicationController
  before_action :set_order

  def new
  end

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @purchase.amount_cents*100,
      description:  "Payment for teddy #{@purchase.product_sku} for order #{@purchase.id}",
      currency:     @purchase.amount.currency
    )

    @purchase.update(payment: charge.to_json, state: 'paid')
    redirect_to cart_purchases_path(@purchase)

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_cart_purchase_payment_path(@purchase)
  end

private

  def set_order
    @cart_items = CartItem.where(user_id: current_user.id)
    @purchase = current_user.purchases.where(state: 'checking').find(params[:purchase_id]) # verifier pourquoi c'est pas pending comme dans le cours

  end
end
