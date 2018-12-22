class PaymentsController < ApplicationController
  before_action :set_order

  def new
  end

  def create
    # ...
  end

private

  def set_order
    @purchase = current_user.purchases.where(state: 'pending').find(params[:purchase_id])
  end
end
