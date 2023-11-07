class AddDefaultPhoto < ActiveRecord::Migration[7.1]
  def up
    change_column :users, :photo, :string, default: "https://cdn-icons-png.flaticon.com/512/1077/1077114.png"
  end

  def down
    change_column :users, :photo, :string, default: nil
  end
end
