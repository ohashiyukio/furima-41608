class AddExpToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :exp, :text
  end
end
