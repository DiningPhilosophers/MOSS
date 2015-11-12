class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :user_name, null: false
      t.string :password_digest, null: false
      t.string :remember_digest
      t.string :reset_digest
      t.timestamps :reset_send_at

      t.timestamps null: false
    end
  end
end
