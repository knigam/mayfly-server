class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @friendships = Friendship.all
    respond_with(@friendships)
  end

  def show
    respond_with(@friendship)
  end

  def new
    @friendship = Friendship.new
    respond_with(@friendship)
  end

  def edit
  end

  def create
    if not friend = User.find_by_email(params[:friend_email])
        @friendship.error(:friend_email, "User account doesn't exist")
    end
    @friendship = current_user.friendships.build(friend_id: friend, friend_name: params[:friend_name])
    @friendship.save
    respond_with(@friendship)
  end

  def update
    @friendship.update(friendship_params)
    respond_with(@friendship)
  end

  def destroy
    @friendship.destroy
    respond_with(@friendship)
  end

  def create_from_event
      @event = current_user.events.find(params[:event_id])
      @users = @event.invites.where(attending: true).map{|i| i.user}
      @users.each do |u|
          current_user.friendships.create(friend_id: u.id, friend_name: u.name)
      end
  end

  private
    def set_friendship
      @friendship = current_user.friendships.find(params[:id])
    end

    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id, :friend_name)
    end
end
