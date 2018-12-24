module CurrentCart
  private

  def set_cart
    @cart = Cart.find_by(id: session[:cart_id]) || Cart.create
    @cart.price_cents = 0
    @cart.user = current_user
    session[:cart_id] ||= @cart.id
    raise
  end
end
