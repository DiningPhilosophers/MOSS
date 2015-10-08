class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :last_name
      t.string :first_name
#       t.integer :group_id
      t.belongs_to :group, index: true
      t.string :email
      t.boolean :contact
#       t.string :zip_code
      t.belongs_to :zipcode, index: true
#       t.integer :country_id
	  t.belongs_to :country, index: true

      t.timestamps null: false
    end
  end
end
