class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
      @user = current_user
      @user1 = User.find_by_id(params[:id])
      @room_name1 = "#{@user.id}-#{@user1.id}"
      @room_name2 = "#{@user1.id}-#{@user.id}"
      if Room.where(name: @room_name1).any?
        @privte_room = Room.where(name: @room_name1).first
      elsif Room.where(name: @room_name2).any?
        @privte_room = Room.where(name: @room_name2).first
      else
        @privte_room = Room.create(is_public: false, name: @room_name1)
      end
      redirect_to room_path(@privte_room)
  end

  def user_room
    @user1 = current_user
    @user2 = User.find_by_id(params[:id])
    @room_name = "#{@user1.id}-#{@user2.id}"
    @room = Room.create(is_public: false, name: @room_name)
    @room.save
    redirect_to root_path(@room)
  end
end
