class Tweet < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags
  validates :tweet, presence: true, length: { maximum: 280 }

  after_create do
    tweet = Tweet.find_by(id: id)
    hashtags = self.tweet.scan(/#\w+/)
    hashtags.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      tweet.tags << tag
    end
  end
end
