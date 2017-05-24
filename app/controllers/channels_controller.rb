class ChannelsController < ApplicationController
  def index
    @channels = Channel.all
  end

  def new
    @channel = Channel.new
  end

  def create
    @channel = current_user.channels.build(channel_params)
    if @channel.save
      flash[:success] = 'Chat room added!'
      redirect_to channels_path
    else
      render 'new'
    end
  end

  def show
    @channels = Channel.all
    @channel = Channel.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end

  private

  def channel_params
    params.require(:channel).permit(:title)
  end

end
