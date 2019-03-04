class CreateDogs < ActiveRecord::Migration[5.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.date :birthday
      t.string :img_url
      t.integer :owner_id

      t.timestamps
    end
  end
end
