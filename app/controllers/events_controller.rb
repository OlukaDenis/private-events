# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :logged_in_user, only: %i[new create destroy]
  before_action :correct_user, only: [:destroy]

  def new
    @event = current_user.creator_events.build
  end

  def index
    @events = Event.paginate(page: params[:page])
    @upcoming = @events.upcoming
    @past = @events.past
  end

  def create
    @event = current_user.creator_events.build(events_params)
    redirect_to root_url if @event.save
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:success] = 'Event deleted successfully'
    redirect_back(fallback_location: current_user)
  end

  private

  def events_params
    params.require(:event).permit(:title, :date, :description)
  end

  def correct_user
    @event = current_user.creator_events.find_by(id: params[:id])
    redirect_to root_url if @event.nil?
  end
end
