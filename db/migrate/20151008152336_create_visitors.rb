class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :first_name
      t.string :last_name
      t.integer :group_id, null: false
      t.string :email
      t.boolean :contact
      t.string :zipcode, null: false
      t.integer :country_id, null: false

      t.timestamps null: false
    end
  end
end
