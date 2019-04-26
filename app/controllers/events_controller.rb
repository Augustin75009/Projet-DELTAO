class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
    if user_signed_in?
      @cart_items = CartItem.where(user_id: current_user.id)
    else
      @cart_items = []
    end
  end

  def new
    if is_admin?
      @event = Event.new
      @cart_items = CartItem.where(user_id: current_user.id)
    else
      redirect_to :root
    end
  end

  def create
    if is_admin?
      @event = Event.new(event_params)
      @event.user_id = current_user
      if @event.save
        redirect_to events_path
      else
        @cart_items = CartItem.where(user_id: current_user.id)
        render :new
      end
    else
      redirect_to :root
    end
  end

  def update
    @event.update(event_params)
    redirect_to events_path
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :end_date, :photo, :location, :link)
  end

  def set_event
    if user_signed_in?
      @cart_items = CartItem.where(user_id: current_user.id)
    else
      @cart_items = []
    end
    @event = Event.find(params[:id])
  end

  def is_admin?
    return current_user.adminkey == "admin"
  end
end
