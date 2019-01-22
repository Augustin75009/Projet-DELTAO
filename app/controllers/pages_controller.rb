class PagesController < ApplicationController
  def home
    @lessons = Lesson.all
  end
end
