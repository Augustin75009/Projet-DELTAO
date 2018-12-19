class PaymentsController < ApplicationController
  before_action :set_purchase
  def new
  end

  def create
  end

  private

  def set_purchase
    @purchase = current_user.purchases.where(state: 'pending').find(params[:purchase_id])
  end
end
