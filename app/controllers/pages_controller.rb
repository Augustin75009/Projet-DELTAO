class PagesController < ApplicationController
  def home
    @lessons = Lesson.all
    @cart_items = CartItem.all
  end
end
