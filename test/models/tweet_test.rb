require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  test 'the truth' do
    assert true
  end

  setup do
    @user = User.new(login: 'Marie', name: 'Marie')
    @user.save
  end

  test 'Aucun tweet' do
    tweet = Tweet.new(user: @user)
    assert_equal(tweet.save, false)
  end

  test 'tweet avec texte null' do
    tweet = Tweet.new(tweet: nil, user: @user)
    assert_equal(tweet.save, false)
  end

  test 'tweet avec texte un caractère' do
    tweet = Tweet.new(tweet: '&', user: @user)
    assert_equal(tweet.save, true)
  end

  test 'tweet avec texte 280 caractères' do
    text = ''
    (1..280).each do |i|
      text += 'a'
    end
    tweet = Tweet.new(tweet: text, user: @user)
    assert_equal(tweet.save, true)
  end

  test 'tweet avec texte 281 caractères' do
    text = ''
    (1..281).each do |i|
      text += 'a'
    end
    tweet = Tweet.new(tweet: text, user: @user)
    assert_equal(tweet.save, false )
  end

  test 'tweet sans utilisateur' do
    text = ''
    (1..280).each do |i|
      text += 'a'
    end
    tweet = Tweet.new(tweet: text)
    assert_equal(tweet.save, false)
  end
end