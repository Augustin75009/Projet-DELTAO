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

  def delete_account
    return unless user_signed_in?

    @user = current_user
    @user.destroy
    redirect_to root_path, alert: "Compte supprimé"
  end
end
