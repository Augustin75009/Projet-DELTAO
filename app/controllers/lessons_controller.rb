class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query5].present?
      @lessons = Lesson.search_by_category(params[:query5])
    elsif params[:query4].present?
      @lessons = Lesson.search_by_category(params[:query4])
    elsif params[:query3].present?
      @lessons = Lesson.search_by_category(params[:query3])
    elsif params[:query2].present?
      @lessons = Lesson.where(child: true)
    elsif params[:query1].present?
      @lessons = Lesson.where(adult: true)
    else
      @lessons = Lesson.all
    end
    @events = Event.all
    @cart_items = CartItem.all
  end

  def show
    @cart_item = CartItem.new
  end

  def new
    if is_admin?
      @lesson = Lesson.new
      @cart_items = CartItem.all
    else
      redirect_to :root
    end
  end

  def create
    if is_admin?
      @lesson = current_user.lessons.build(lesson_params)
      @lesson.slot << params[:lesson]["slot"]
      @lesson.save
      redirect_to lesson_path(@lesson)
    else
      redirect_to :root
    end
  end

  def edit
  end

  def add_date
    @lesson.slot << params[:lesson]["slot"]
    @lesson.save
    redirect_to lesson_path(@lesson)
  end

  def update
    @lesson.slot << params[:lesson]["slot"]
    @lesson.update(lesson_params_edit)
    redirect_to lesson_path(@lesson)
  end

  def destroy
    @lesson.destroy
    redirect_to lessons_path
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :description, :price_cents, :photo, :quantity, :category, :adult, :child, :phone_booking, :payable, :online_booking, :gift_card, :card_description, :slot)
  end

  def lesson_params_edit
    params.require(:lesson).permit(:title, :description, :price_cents, :photo, :quantity, :category, :adult, :child, :phone_booking, :payable, :online_booking, :gift_card, :card_description)
  end

  def set_lesson
    @cart_items = CartItem.all
    @lesson = Lesson.find(params[:id])
  end

  def is_admin?
    # return current_user.adminkey == "admin"
    true
  end
end
