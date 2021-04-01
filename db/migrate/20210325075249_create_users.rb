class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, index: {unique: true}, limit: 20
      t.string :img_url
      t.timestamps
    end
  end
end
