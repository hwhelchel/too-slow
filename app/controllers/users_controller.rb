class UsersController < ApplicationController

  def index
    @users = User.by_karma.limit(50)
  end
end
