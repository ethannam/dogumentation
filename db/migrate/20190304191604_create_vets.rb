class CreateVets < ActiveRecord::Migration[5.1]
  def change
    create_table :vets do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :phone_num
      t.string :email

      t.timestamps
    end
  end
end
