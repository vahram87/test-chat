class UsersController < ApplicationController
  def show
      @user = User.find_by_id(params[:id])
      @users = User.where.not(id: current_user)

      @room = Room.new
      @rooms = Room.where(is_public: true)
  end
end
