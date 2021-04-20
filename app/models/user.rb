class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3,maximum: 20 }
  validates :status, length: {maximum: 24}

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
