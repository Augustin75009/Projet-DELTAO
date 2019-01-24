class LessonsController < ApplicationController
    before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @lessons = Lesson.search_by_title_and_category(params[:query])
    else
      @lessons = Lesson.all
    end
  end

  def show
    # if params[:tab].present?
    #    respond_to do |format|
    #     format.html { redirect_to lesson_path }
    #     format.js
    #   end
    # end
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.save
    redirect_to lesson_path(@lesson)
  end

  def edit
  end

  def update
    @lesson.update(lesson_params)
    redirect_to lesson_path(@lesson)
  end

  def destroy
    @lesson.destroy
    redirect_to lessons_path
  end

  private

  def lesson_params
    params.require(:lesson).permit(:name, :description, :price_cents, :photo, :quantity)
  end


  def set_lesson
    @lesson = Lesson.find(params[:id])
  end
end
