class GroupsController < ApplicationController
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
      redirect_to groups_path
    else
      render 'new'
    end
  end

  private

  def chat_room_params
    params.require(:group).permit(:title)
  end
end
