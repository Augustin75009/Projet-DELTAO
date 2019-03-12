class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to events_path
  end

  def update
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def destroy
    @event.destroy
    redirect_to :root
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :end_date, :photo, :location)
  end

  def set_event
    @event = Lesson.find(params[:id])
  end
end
