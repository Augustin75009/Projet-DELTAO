class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
    lesson_service = LessonService.new(params)
    @lessons = lesson_service.index
    if user_signed_in?
      @cart_items = CartItem.where(user_id: current_user.id)
    else
      @cart_items = []
    end
  end

  def show
    @cart_item = CartItem.new
  end

  def new
    if is_admin?
      @lesson = Lesson.new
      @cart_items = CartItem.where(user_id: current_user.id)
    else
      redirect_to :root
    end
  end

  def create
    if is_admin?
      @lesson = current_user.lessons.build(lesson_params)
      @lesson.slot << params[:lesson]["slot"]
      @lesson.slot.reject!(&:blank?)
      @lesson.slot.reject! { |y| y.nil? }
      @lesson.price_cents = @lesson.price_cents * 1000
      if @lesson.save
        redirect_to lesson_path(@lesson)
      else
        @cart_items = CartItem.where(user_id: current_user.id)
        render :new
      end
    else
      redirect_to :root
    end
  end

  def edit
  end

  def update
    if params["true"] == "true"
      @lesson.slot << params[:lesson]["slot"]
    else
      if params[:lesson]["slot"].class != NilClass
        @lesson.slot -= [params[:lesson]["slot"].to_date]
        @lesson.slot -= [params[:lesson]["slot"]]
      end
    end
    @lesson.slot.reject!(&:blank?)
    @lesson.slot.reject! { |y| y.nil? }
    @lesson.update(lesson_params_edit)
    redirect_to lesson_path(@lesson)
  end

  def destroy
    @lesson.destroy
    redirect_to lessons_path
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title,
                                    :description,
                                    :price_cents,
                                    :photo,
                                    :quantity,
                                    :category,
                                    :adult,
                                    :child,
                                    :phone_booking,
                                    :payable,
                                    :pricing,
                                    :deposit, :gift_card, :card_description, :slot, :schedule, :pic_position, :alt)
  end

  def lesson_params_edit
    params.require(:lesson).permit(:title,
                                    :description,
                                    :price_cents,
                                    :photo,
                                    :quantity,
                                    :category,
                                    :adult,
                                    :child,
                                    :phone_booking,
                                    :payable,
                                    :pricing,
                                    :deposit, :gift_card, :card_description, :schedule, :pic_position, :alt)
  end

  def set_lesson
    if user_signed_in?
      @cart_items = CartItem.where(user_id: current_user.id)
    else
      @cart_items = []
    end
    @lesson = Lesson.find(params[:id])
  end

  def is_admin?
    return current_user.adminkey == "admin"
  end
end
