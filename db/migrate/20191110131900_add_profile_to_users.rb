class AddProfileToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :profile, :integer, default: 1
  end
end
