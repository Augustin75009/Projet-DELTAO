class GiftsController < ApplicationController
  def create
    @gift = Gift.new
    @cart = Cart.find(params[:cart_id])
    set_user_infos
    @gift.product_sku = Lesson.find(params[:slot]).title
    @gift.user = @user
    @gift.state = 'checking'
    @gift.gift_to = params[:gift_to]
    @gift.gift_from = params[:gift_from]
    @gift.amount_cents = @cart.price_cents
    if @gift.save! && provided_phone
      redirect_to new_cart_gift_payment_path(gift: true, gift_id: @gift.id, lesson: params[:slot])
    else
      @cart_items = CartItem.where(user: current_user)
      redirect_to cart_path(gift: true, id: params[:cart_id], lesson: params[:slot]), alert: "N° de téléphone invalide"
    end
  end

  def set_user_infos
    @user = User.find(@cart.user.id)
    phone = validate_phone_format ? nil : params[:phone]
    @user.phone = phone
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.address = params[:address]
    @user.zip = params[:zip]
    @user.contact_email = params[:contact_email]
    @user.city = params[:city]
    @user.save
  end

  def validate_phone_format
    phone = params[:phone]
    test_regexp = phone =~ /^0[1-9](?:\d{8})|0[1-9](?: \d\d){4}$/
    test_regexp.nil?
  end

  def provided_phone
    return @gift.user.phone.class != NilClass && @gift.user.phone != ""
  end
end
