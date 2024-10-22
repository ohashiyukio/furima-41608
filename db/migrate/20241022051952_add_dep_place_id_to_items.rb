class AddDepPlaceIdToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :dep_place_id, :integer
  end
end
