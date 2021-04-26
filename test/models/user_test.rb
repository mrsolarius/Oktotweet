# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'the truth' do
    assert true
  end

  test 'unique login' do
    # check if uniqueness of login field
    @user = User.new(login: 'louis', name: 'nom')
    assert_equal(@user.save, true)
    @user = User.new(login: 'louis', name: 'bla')
    assert_equal(@user.save, false)
  end

  test 'min login length' do
    # min login length is 3 character
    @user = User.new(login: 'lo', name: 'nom')
    assert_equal(@user.save, false)
  end

  # This test cant be taken 5 minutes
  # So go make your coffee cup
  test 'login syntax' do
    # Check if the accepted characters are the only ones to be accepted when saving
    authorized_char = [*'0'...'9', *'a'...'z', *'A'...'Z', '_']
    # A most common special character that can be found on the AZERTY keyboard
    special_char = %w[é è à ù ç - \ . ; : ! ? @ & § ~ ^ ` ¨ ' °
                      | ( ) { } [ ] / \ < > ² * + = % µ € $ ¤ £
                      . â Â ä Ä ã Ã à À ê Ê ë Ë è È ì Ì î Î ï Ï
                      ñ Ñ ô Ô ö Ö õ Õ ò Ò ù Ù û Û ü Ü ÿ]
    special_char.push(' ')
    special_char.push(*authorized_char)
    # generate every 3 letter word possibility with a special char list (3 letters because it's not too long to generate them)
    words = special_char.combination(3).to_a
    # take a shuffled small sample to test (6666 sample to get in avg 500 words that pass the test)
    words = words.shuffle.slice(1, 6666)
    words.each do |word|
      # return true if each letter of the word is contained in an authorised char array
      try = word.all? do |letter|
        word.count(letter) <= authorized_char.count(letter)
      end
      # uncomment to see the generation and validation process
      # print "#{try},#{word.join('')}\n"
      @user = User.new(login: word.join(''), name: 'nom')
      assert_equal(@user.save, try)
    end
  end

  test 'max login length' do
    # max login length is 15 character
    @user = User.new(login: 'timeeeeeeeeeeeee', name: 'nom')
    assert_equal(@user.save, false)
  end

  test 'max name length' do
    # max name length is 50 character
    @user = User.new(login: 'time', name: 'timeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee')
    assert_equal(@user.save, false)
  end

  test 'max location length' do
    # max name length is 30 character
    @user = User.new(login: 'tim', name: 'tim', location: 'Ranceeeeeeeeeeeeeeeeeeeeeeeeeee')
    assert_equal(@user.save, false)
  end

  test 'no login' do
    # user need login
    @user = User.new(name: 'nom')
    assert_equal(@user.save, false)
  end

  test 'no name' do
    # user need name
    @user = User.new(login: 'tim')
    assert_equal(@user.save, false)
  end

  test 'nominal' do
    # it's the nominal case
    @user = User.new(login: 'tim', name: 'Tim The Master Of The Universe', location: 'Everywhere in Universe')
    assert(@user.save)
  end
end
