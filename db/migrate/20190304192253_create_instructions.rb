class CreateInstructions < ActiveRecord::Migration[5.1]
  def change
    create_table :instructions do |t|
      t.string :header
      t.string :content
      t.integer :dog_id

      t.timestamps
    end
  end
end
