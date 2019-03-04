class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.integer :vet_id
      t.integer :dog_id

      t.timestamps
    end
  end
end
