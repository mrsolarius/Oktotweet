class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :status
      t.text :bio
      t.string :imageName
      t.binary :imageB64, limit: 50.megabyte
      t.timestamps
    end
  end
end
