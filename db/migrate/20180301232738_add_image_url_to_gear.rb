class AddImageUrlToGear < ActiveRecord::Migration[5.1]
  def change
    add_column :gears, :image_url, :string
  end
end
