class AddScheduleDateIdToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :schedule_date_id, :integer
  end
end
