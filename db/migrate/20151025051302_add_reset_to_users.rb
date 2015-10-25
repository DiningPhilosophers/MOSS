class AddResetToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :reset_digest, :string
    add_column :admins, :reset_sent_at, :datetime
  end
end
