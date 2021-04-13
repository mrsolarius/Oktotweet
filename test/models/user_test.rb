require "test_helper"

class UserTest < ActiveSupport::TestCase

  test "the truth" do
    assert true
  end

  test "min name length" do
    # min name length is 3 character
    @user = User.new(name:"lo",img_url:"url")
    assert_equal(@user.save,false )
  end

  test "max name length" do
    # max name length is 20 character
    @user = User.new(name:"timeeeeeeeeeeeeeeeeee",img_url:"url")
    assert_equal(@user.save,false )
  end

  test "no name" do
    # user need name
    @user = User.new(img_url:"url")
    assert_equal(@user.save,false )
  end

  test "no url" do
    # user need url
    @user = User.new(name:"tim")
    assert_equal(@user.save,false)
  end

  test "nominal" do
    # it's the nominal case
    @user = User.new(name:"tim",img_url:"https://tim.fr")
    assert(@user.save)
  end
end
