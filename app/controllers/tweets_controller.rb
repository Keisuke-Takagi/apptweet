class TweetsController < ApplicationController
  before_action :define_tweets, except: [:new,:create,:update]
  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end
  def new
    @tweet = Tweet.new
  end
  
  def create
    Tweet.create(text: tweet_params[:text], user_id: current_user.id)
    
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.destroy
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(tweet_params)
    end
    redirect_to ""
  end

  def define_tweets
    tweets = Tweet.all
  end

  private
  def tweet_params
    params.require(:tweet).permit(:image, :text)
  end


end
