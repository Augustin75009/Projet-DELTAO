class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
    @cart_items = CartItem.all
  end

  def new
    if is_admin?
      @event = Event.new
      @cart_items = CartItem.all
    else
      redirect_to :root
    end
  end

  def create
    if is_admin?
      @event = Event.new(event_params)
      @event.save
      raise
      redirect_to events_path
    else
      redirect_to :root
    end
  end

  def update
    @event.update(event_params)
    redirect_to eventS_path
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :end_date, :photo, :location)
  end

  def set_event
    @cart_items = CartItem.all
    @event = Event.find(params[:id])
  end

  def is_admin?
    return current_user.adminkey == "admin"
  end
end
