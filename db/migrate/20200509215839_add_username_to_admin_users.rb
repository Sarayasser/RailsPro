class AddUsernameToAdminUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :admin_users, :username, :string
  end
end
