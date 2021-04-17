class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3,maximum: 20 }
  validates :imageUrl, presence: true
end