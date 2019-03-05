class AddColumnUsernameToDogs < ActiveRecord::Migration[5.1]
  def change
    add_column :dogs, :username, :string
  end
end
