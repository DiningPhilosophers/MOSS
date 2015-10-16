class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :group_size, null: false
      t.datetime :visit_date, null: false

      t.timestamps null: false
    end
  end
end
