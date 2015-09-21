class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @events = current_user.invites.map{ |i| i if (i.event.active && (i.event.max == -1 || i.attending || i.event.invites.where(attending: true).count < i.event.max))}.compact.map{|i| i.event}
    respond_with(@events)
  end

  def show
    respond_with(@event)
  end

  def new
    @event = Event.new
    respond_with(@event)
  end

  def edit
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
        invite = current_user.invites.build(:event_id => @event.id, :attending => true, :creator => true)
        invite.save
    end
    respond_with(@event)
  end

  def update
    @event.update(event_params)
    respond_with(@event)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  private
    def set_event
      @event = current_user.events.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :description, :start_time, :end_time, :location, :min, :max, :open, :active)
    end
end
