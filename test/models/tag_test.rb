require "test_helper"

class TagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @user = User.new(login: 'Mei', name: 'Misaki')
    @user.save
  end

  test "tag créé quand un tweet en contiens un" do
    tweet = Tweet.new(tweet: "#tuturu el psy congroo !", user: @user)
    tweet.save
    hash = Tag.find_by(name: "tuturu")
    assert_equal(hash.is_a?(Tag), true)
  end

  test "tag créé qu'une seule fois en 2 tweets" do
    tweet = Tweet.new(tweet: "#minami for ever", user: @user)
    tweet.save
    tweet = Tweet.new(tweet: "#minami is the best <3", user: @user)
    tweet.save
    hash = Tag.find_by(name: "minami")
    assert_equal(hash.is_a?(Tag), true)
  end
end