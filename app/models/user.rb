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

  has_many :tweets
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
