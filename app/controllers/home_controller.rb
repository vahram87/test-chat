class HomeController < ApplicationController
  def index
      @users = User.where.not(id: current_user)
      @room = Room.new
      @rooms = Room.where(is_public: true)
  end
end
