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

  def use_gift_code
    unless gift_code_valid?
      respond_to do |format|
        format.html { redirect_to lessons_path(query6: true), alert: "Bon cadeau invalide" }
        format.js { flash.now[:alert] = 'Bon cadeau invalide' }
      end
    else 
      @user = current_user
      date = params[:gift_code].split("-")[0]
      id = params[:gift_code].split("-")[1].to_i
  
      @gift = Gift.find(id)
  
      gift_date = @gift.created_at.to_date.to_formatted_s(:number)
  
      if gift_date == date && @gift.state != 'used' && gift_still_valid?
        @lesson = Lesson.find_by(title: @gift.product_sku)
        respond_to do |format|
          format.html { redirect_to lessons_path(query6: true) }
          format.js
        end
      else
        respond_to do |format|
          format.html { redirect_to lessons_path(query6: true), alert: "Bon cadeau invalide" }
          format.js { flash.now[:alert] = 'Bon cadeau invalide' }
        end
      end
    end
  end

  def gift_still_valid?
    @gift.created_at - DateTime.now < 0
  end

  def gift_code_valid?
    # check if gift still valid with date
    value = params[:gift_code].split("-")

    return false if value.length != 2
    return false if value[0].to_i == 0
    return false if value[1].to_i == 0

    return true
  end
end
