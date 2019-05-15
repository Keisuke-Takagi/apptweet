class TweetsController < ApplicationController
  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end
  def new
  end
end
