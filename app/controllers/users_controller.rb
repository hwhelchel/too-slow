class UsersController < ApplicationController

  def index
    @users = User.order('total_karma_points DESC').limit(1000)
  end
end
