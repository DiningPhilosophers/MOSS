class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :group_size
      t.datetime :visit_date

      t.timestamps null: false
    end
  end
end
