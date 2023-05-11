class TweetsController < ApplicationController
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
    @tweet = Tweet.find(params[:id])
    if current_user.id != @tweet.user.id
       redirect_to root_path
    end
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
       redirect_to tweet_path(@tweet.id)
    else
       render :edit
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if (user_signed_in? && current_user.id == tweet.user.id)
      tweet.destroy
    end
    redirect_to root_path
  end
  

  private
  def tweet_params
    params.require(:tweet).permit(:image, :title, :content).merge(user_id: current_user.id)
  end

end
