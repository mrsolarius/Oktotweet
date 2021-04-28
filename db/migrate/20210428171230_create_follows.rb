class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows, if_not_exists: true do |t|
      t.integer :follower_user_id, null: false, foreign_key: true
      t.integer :followed_user_id, null: false, foreign_key: true
      t.timestamps
    end
    add_index :follows, %i[followed_user_id follower_user_id], unique: true
  end
end
