class PaymentsController < ApplicationController
  before_action :set_purchase
  def new
  end

  def create
  end

  private

  def set_purchase
    @purchase = current_user.purchases.where(state: 'pending').find(params[:order_id])
  end



  # def create
  # @purchase = Purchase.find(params[:adoption_id])
  # customer = Stripe::Customer.create(
  #     source: params[:stripeToken],
  #     email:  params[:stripeEmail]
  #   )

  # charge = Stripe::Charge.create(
  #     customer:     customer.id,
  #     amount:       @purchase.product.price_cents,
  #     description:  "Payment for #{@purchase.product.name}",
  #     currency:     "EUR"
  # )

  # @purchase.update(status: 'paid')
  # # authorize @adoption
  # redirect_to status_path

  # rescue Stripe::CardError => e
  #   flash[:alert] = e.message
  #   redirect_to status_path
  # end

end
