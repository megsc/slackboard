class GroupsController < ApplicationController
  def show
      @group = Group.find_by(id: params[:id])
  end

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group= current_user.groups.build(group_params)
    if @group.save
      flash[:success] = 'Group added!'
      redirect_to user_groups_path(current_user.id)
    else
      render 'new'
    end
  end

  private

  def group_params
    params.require(:group).permit(:title)
  end
end
