class CreateZipcodes < ActiveRecord::Migration
  def change
    create_table :zipcodes, id:false do |t|
      t.string :zipcode, null: false
      t.string :city, null: false
      t.string :state, null: false

      # t.timestamps null: false
    end
    add_index "zipcodes", ["zipcode"], name: "index_zipcodes_on_zipcode", unique: true, using: :btree
  end
end
