class GroupingsController < ApplicationController
  before_action :set_grouping, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @groupings = Grouping.all
    respond_with(@groupings)
  end

  def show
    respond_with(@grouping)
  end

  def new
    @grouping = Grouping.new
    respond_with(@grouping)
  end

  def edit
  end

  def create
    @grouping = Grouping.new(grouping_params)
    @grouping.save
    respond_with(@grouping)
  end

  def update
    @grouping.update(grouping_params)
    respond_with(@grouping)
  end

  def destroy
    @grouping.destroy
    respond_with(@grouping)
  end

  private
    def set_grouping
      @grouping = Grouping.find(params[:id])
    end

    def grouping_params
      params.require(:grouping).permit(:group_id, :friendship_id)
    end
end
