class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_tweets, only: [:edit, :update, :show]

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
       redirect_to root_path
    else
       render :new
    end
  end

  def edit
    if current_user.id != @tweet.user.id
       redirect_to root_path
    end
  end

  def update
    if @tweet.update(tweet_params)
       redirect_to tweet_path(@tweet.id)
    else
       render :edit
    end
  end

  def show
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if (user_signed_in? && current_user.id == tweet.user.id)
      tweet.destroy
    end
    redirect_to root_path
  end
  
  def search
    @tweets = Tweet.search(params[:keyword])
  end

  private
  def tweet_params
    params.require(:tweet).permit(:image, :title, :content).merge(user_id: current_user.id)
  end

  def set_tweets
    @tweet = Tweet.find(params[:id])
  end

end
