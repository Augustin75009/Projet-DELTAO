class PagesController < ApplicationController
  def home
    @lessons = Lesson.all
    if user_signed_in?
      @cart_items = CartItem.where(user_id: current_user.id)
    else
      @cart_items = []
    end
  end

  def tessa
    if user_signed_in?
      @cart_items = CartItem.where(user_id: current_user.id)
    else
      @cart_items = []
    end
  end

  def settings
    if user_signed_in?
      @cart_items = CartItem.where(user_id: current_user.id)
      @user = current_user
    else
      @cart_items = []
    end
  end

  def update_user_infos
    @cart_items = CartItem.where(user_id: current_user.id)
    @user = current_user
    user_params
    redirect_to users_setting_path, alert: "informations misent à jour"
  end

  def delete_account
    return unless user_signed_in?

    @user = current_user
    @user.destroy
    redirect_to root_path, alert: "Compte supprimé"
  end

  private

  def user_params
    phone = validate_phone_format ? nil : params[:phone]
    @user.phone = phone
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.address = params[:address]
    @user.zip = params[:zip]
    @user.contact_email = params[:contact_email]
    @user.city = params[:city]
    @user.save!
  end

  def validate_phone_format
    phone = params[:phone]
    test_regexp = phone =~ /^0[1-9](?:\d{8})|0[1-9](?: \d\d){4}$/
    test_regexp.nil?
  end
end
