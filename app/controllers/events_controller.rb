class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def create
    @event = current_user.events.build(events_params)
    if @event.save
      redirect_to root_url
    end
  end

  def show
    # @event = Event.find_by(id: params[:id])
  end

  private

  def events_params
    params.require(:event).permit(:title, :date, :description)
  end
end
