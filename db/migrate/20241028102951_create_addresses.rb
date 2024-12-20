class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string     :post_no,      null: false
      t.integer    :dep_place_id,    null: false
      t.string     :city,         null: false
      t.string     :city_no,      null: false
      t.string     :building
      t.string     :phone_no,     null: false
      t.references :order,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
