class AddRoleUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :role, :string, default: ''
  end
end
