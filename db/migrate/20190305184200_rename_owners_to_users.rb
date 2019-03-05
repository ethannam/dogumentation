class RenameOwnersToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_table :owners, :users
  end
end
