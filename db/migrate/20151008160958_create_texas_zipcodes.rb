class CreateTexasZipcodes < ActiveRecord::Migration
  def change
    create_table :texas_zipcodes, id:false do |t|
      t.string :zipcode, null: false
      t.string :city, null: false
      t.string :county, null: false

      # t.timestamps null: false
    end
    add_index "zipcodes", ["zipcode"], name: "pk_zipcode", unique: true, using: :btree
  end
end
