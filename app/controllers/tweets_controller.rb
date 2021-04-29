class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy ]

  # GET /tweets or /tweets.json
  def index
    @user_auth = auth_user
    @tweets = Tweet.all
  end

  # GET /tweets/1 or /tweets/1.json
  def show
  end

  def follow_feed
    @user_auth = auth_user
    @tweets = []
    Tweet.all.order('created_at DESC').each do |tweet|
      @tweets << tweet if @user_auth.followings.include?(tweet.user)
    end
  end
  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end


  # POST /tweets or /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: 'Tweet was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy

    respond_to do |format|
      if @tweet.user.id == auth_user_id
        @tweet.destroy
        format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
      else
        @tweets = Tweet.all
        format.html { redirect_to tweets_url, notice: 'Vous ne pouvez pas supprimer les tweet des autres' }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tweet
    @user_auth = auth_user
    @tweet = Tweet.find(params[:id])
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
