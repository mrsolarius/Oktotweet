class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets, if_not_exists: true do |t|
      t.string :tweet
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :tweets, :user_id, unique: true
  end
end
