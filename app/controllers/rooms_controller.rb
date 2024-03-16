class RoomsController < ApplicationController
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to user_path(current_user)
    else
      redirect_to root_path
    end
  end

  private
  def room_params
    params.require(:room).permit(:name)
  end
end
