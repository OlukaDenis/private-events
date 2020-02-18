class AttendancesController < ApplicationController
  before_action :logged_in_user

  def attend_event
    @event = Event.find(params[:event_id])
    current_user.attend @event
    flash[:success] = 'Successfuly added to attended events!'
    redirect_back(fallback_location: @event)
  end

  def leave_event
    @event = Event.find(params[:event_id])
    current_user.leave @event
    flash[:success] = 'Successfuly left the event!'
    redirect_back(fallback_location: @event)
  end
end
