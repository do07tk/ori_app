class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @tweets = user.tweets
    @nickname = user.nickname
  end
end
