class CreateTweetsTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags_tweets, id: false do |t|
      t.references :tweet, index: true, foreign_keys: true
      t.references :tag, index: true, foreign_keys: true

      t.timestamps
    end
    add_index :tags_tweets, %i[tweet_id tag_id], unique: true
  end
end
