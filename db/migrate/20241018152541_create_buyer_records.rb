class CreateBuyerRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :buyer_records do |t|

      t.timestamps
    end
  end
end
