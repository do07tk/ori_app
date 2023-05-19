class LikesController < ApplicationController
  before_action :authenticate_user!, only:[:index]
  before_action :set_tweet, only: [:create, :destroy]

  def index
    likes = current_user.likes.pluck(:tweet_id)
    @tweets = Tweet.where(id: likes)
  end

  def create
    like = current_user.likes.build(tweet_id: params[:tweet_id])
    like.save
    render 'create.js.erb'
  end

  def destroy
    like = Like.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
    like.destroy
    render 'destroy.js.erb'
  end

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

end
