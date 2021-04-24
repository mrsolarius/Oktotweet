class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :login, unique: true
      t.string :name
      t.text :bio
      t.string :location
      t.string :imageName
      t.binary :imageB64, limit: 50.megabyte
      t.timestamps
    end
  end
end
