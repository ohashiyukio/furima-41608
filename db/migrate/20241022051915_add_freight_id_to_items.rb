class AddFreightIdToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :freight_id, :integer
  end
end
