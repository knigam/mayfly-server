class InvitesController < ApplicationController
  before_action :set_invite, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @invites = Invite.all
    respond_with(@invites)
  end

  def show
    respond_with(@invite)
  end

  def new
    @invite = Invite.new
    event = current_user.events.find(params[:event_id])
    @invite.event = event
    respond_with(@invite)
  end

  def edit
  end

  def create
    if not @event = current_user.events.find(params[:event_id])
        @invite.error.add(:event_id, "Event not found or user is not creator of event")
        render @invite.error.messages
    end
    user = User.find(params[:invite][:user_id])
    user.invites.build(event_id: @event.id, attending: false, creator: false)
    user.save
#    @users = params[:users]
#    @users.each do |u|
#        user = User.find(u)
#        user.invites.build(event_id: @event.id, attending: false, creator: false)
#        user.save
#        user.devices.each do |d|
#            if d.type == "android"
#                Push::MessageGcm.create(
#                    app: 'Mayfly',
#                    device: d.reg_id.to_s,
#                    payload: {message: 'You have been invited to the event "' + @event.name + '"message='},
#                    collapse_key: 'Invite')
#            end
#        end
#    end
    redirect_to event_path(@event)
  end

  def update
    @invite.update(invite_params)
    redirect_to event_path(@invite.event)
  end

  def destroy
    @invite.destroy
    respond_with(@invite)
  end

  private
    def set_invite
      @invite = current_user.invites.find_by_event_id(params[:event_id])
    end

    def invite_params
      params.require(:invite).permit(:event_id, :attending)
    end
end
