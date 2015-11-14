class CreateTexasZipcodes < ActiveRecord::Migration
  def change
    create_table :texas_zipcodes, id:false do |t|
      t.string :zip_code, null: false
      t.string :city, null: false
      t.string :county, null: false

      # t.timestamps null: false
    end
    add_index "zipcodes", ["zip_code"], name: "pk_zip_code", unique: true, using: :btree
  end
end
