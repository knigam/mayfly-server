class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @groups = current_user.groups
    respond_with(@groups)
  end

  def show
    respond_with(@group)
  end

  def new
    @group = Group.new
    respond_with(@group)
  end

  def edit
  end

  def create
    @group = current_user.groups.build(group_params)
    @group.save
    respond_with(@group)
  end

  def update
    @group.update(group_params)
    respond_with(@group)
  end

  def destroy
    @group.destroy
    respond_with(@group)
  end

  private
    def set_group
      @group = current_user.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name)
    end
end
