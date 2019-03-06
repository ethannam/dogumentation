class RemoveColumnImgUrlFromDogsTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :dogs, :img_url
  end
end
