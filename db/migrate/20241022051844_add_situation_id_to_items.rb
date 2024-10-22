class AddSituationIdToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :situation_id, :integer
  end
end
