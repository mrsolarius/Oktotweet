require "test_helper"

class FollowTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @user = User.new(login: 'Anna', name: 'Montana')
    @user.save
  end

  test "user can follow other user" do
    user = User.new(login: "logan", name: "Moriarty")
    user.save
    follow = Follow.new(followed_user: @user, follower: user)
    assert_equal(follow.save, true)
  end

  test "user can't follow same user" do
    follow = Follow.new(followed_user: @user, follower: @user)
    assert_equal(follow.save, false)
  end

  test "user can't have follower null" do
    follow = Follow.new(followed_user: @user, follower: nil)
    assert_equal(follow.save, false)
  end

  test "user can't have followed user null" do
    follow = Follow.new(followed_user: nil, follower: @user)
    assert_equal(follow.save, false)
  end

  test "user can't have followed user and follower null" do
    follow = Follow.new(followed_user: nil, follower: nil)
    assert_equal(follow.save, false)
  end
end