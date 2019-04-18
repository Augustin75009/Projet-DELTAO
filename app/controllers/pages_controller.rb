class PagesController < ApplicationController
  def home
    @lessons = Lesson.all
    if user_signed_in?
      @cart_items = CartItem.where(user_id: current_user.id)
    else
      @cart_items = []
    end
  end
end
