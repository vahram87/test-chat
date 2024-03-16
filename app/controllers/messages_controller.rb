class MessagesController < ApplicationController
  def create
    @room = Room.find_by_id(params[:room_id])
    user = current_user
    @message = user.messages.create(content: message_params[:content], room: @room)
    @message.save
    redirect_to room_path(@room)
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end
end
