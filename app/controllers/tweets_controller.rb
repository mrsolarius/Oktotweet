class TweetsController < ApplicationController
  before_action :set_session
  before_action :set_tweet, only: %i[ show edit update destroy]

  # GET /tweets
  def index
    @tweets = Tweet.all
  end

  # GET /following/
  def follow_feed
    @tweets = []
    if !@user_auth.nil?
      Tweet.all.order('created_at DESC').each do |tweet|
        @tweets << tweet if @user_auth.followings.include?(tweet.user)
      end
    else
      raise ActionController::MethodNotAllowed, 'Veuillez vous connecter'
    end
  end

  # GET /hashtags/:hashtag
  def hashtag
    tag = Tag.order('created_at DESC').find_by(name: params[:hashtag])
    if !tag.nil?
      @tweets = tag.tweets
      @hashtag = tag.name
    else
      @tweets = []
      @hashtag = params[:hashtag]
    end
  end

  # GET /tweets/1
  def show
  end
  
  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # POST /tweets
  def create
    @tweet = Tweet.new(tweet_params)
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: 'L\'OktoTweet a bien été créé' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  def destroy

    respond_to do |format|
      if @tweet.user.id == auth_user_id
        @tweet.destroy
        format.html { redirect_to tweets_url, notice: 'L\OktoTweet a bien été supprimer.' }
      else
        @tweets = Tweet.all
        format.html { redirect_to tweets_url, notice: 'Vous ne pouvez pas supprimer les tweets des autres utilisateurs' }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def set_session
    @user_auth = auth_user
  end
  # Only allow a list of trusted parameters through.
  def tweet_params
    @tweet_parms = params.require(:tweet).permit(:tweet)
    @tweet_parms[:user] = auth_user
    @tweet_parms
  end

  def auth_user
    User.find(auth_user_id) unless auth_user_id.nil?
  end

  def auth_user_id
    session[:current_user_id] unless session[:current_user_id].nil?
  end
end
