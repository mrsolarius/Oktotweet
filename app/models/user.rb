# frozen_string_literal: true
# Class user
class User < ApplicationRecord
  # prevent login update
  validates :login, presence: true,
                    format: { with: /\A[a-zA-Z_0-9]*\z/ },
                    length: { minimum: 3, maximum: 15 },
                    uniqueness: true

  validates :name, presence: true, length: { maximum: 50 }

  validates :location, length: { maximum: 30 }

  # Will return an array of tweets written by user
  has_many :tweets, foreign_key: :user_id, class_name: 'Tweet'

  # Will return an array of follows for the given user instance
  has_many :received_follows, foreign_key: :followed_user_id, class_name: 'Follow'
  # Will return an array of users who follow the user instance
  has_many :followers, through: :received_follows, source: :follower

  #####################

  # returns an array of follows a user gave to someone else
  has_many :given_follows, foreign_key: :follower_user_id, class_name: 'Follow'

  # returns an array of other users who the user has followed
  has_many :followings, through: :given_follows, source: :followed_user


  # get user profile image from parameter and set in object
  def profile_img=(user_params)
    self.imageName = base_part_of(user_params.original_filename)
    self.imageB64 = user_params.read
  end

  # remove unusable character
  def base_part_of(file_name)
    File.basename(file_name).gsub(/[^\w._-]/, '')
  end
end
