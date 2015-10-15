class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  # def index
  #   @tweets = Tweet.all
  #   respond_with(@tweets)
  # end

  # def show
  #   respond_with(@tweet)
  # end

  def new
    @tweet = Tweet.new
  end

  def edit
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    @tweet.save
    redirect_to root_path
  end

  # def update
  #   @tweet.update(tweet_params)
  #   respond_with(@tweet)
  # end

  # def destroy
  #   @tweet.destroy
  #   respond_with(@tweet)
  # end

  private
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    def tweet_params
      params.require(:tweet).permit(:user_id, :body)
    end
end
