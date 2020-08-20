class LessonService

  include ActiveModel::Model

  attr_reader :attributes

  def initialize(attributes)
    @attributes = attributes || {}
  end

  def index
    if @attributes[:query6].present?
      @lessons = Lesson.where(gift_card: true).order('created_at')
    elsif @attributes[:query5].present?
      @lessons = Lesson.search_by_category(params[:query5]).order('created_at')
    elsif @attributes[:query4].present?
      @lessons = Lesson.search_by_category(params[:query4]).order('created_at')
    elsif @attributes[:query2].present?
      @lessons = Lesson.search_by_category(params[:query2]).order('created_at')
    elsif @attributes[:query1].present?
      @lessons = Lesson.where(adult: true).order('created_at')
    elsif @attributes[:query3].present?
      @lessons = Lesson.where(child: true).order('created_at')
    else
      @lessons = Lesson.all.order('created_at')
    end
    return @lessons
  end

  def save
  end

  def update
  end
end