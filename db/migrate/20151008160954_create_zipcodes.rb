class CreateZipcodes < ActiveRecord::Migration
  def change
    create_table :zipcodes, id:false do |t|
      t.string :zip_code, null: false
      t.string :city
      t.string :county

      t.timestamps null: false
    end
    add_index "zipcodes", ["zip_code"], name: "index_zipcodes_on_zip_code", unique: true, using: :btree
  end
end
