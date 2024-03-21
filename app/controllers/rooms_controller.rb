class RoomsController < ApplicationController
  before_action :authenticate_user!
  def show
    @k = current_user
    @room = Room.find_by_id(params[:id])
    if @room.is_public == false
      room_name = @room.name.split("-").map(&:to_i)
      if current_user.id == room_name[0]
        @user = User.find(room_name[1])
      else
        @user = User.find(room_name[0])
      end
      if current_user.id != room_name[0] && current_user.id != room_name[1]
        redirect_to root_path
      end
    end

    @message = Message.new
    @messages = @room.messages.order(created_at: :desc)
  end
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def room_params
    params.require(:room).permit(:name)
  end
end
