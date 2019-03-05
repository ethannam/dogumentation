class RenameColumnOwnerIdInDogsTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :dogs, :owner_id, :user_id
  end
end
