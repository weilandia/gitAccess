class AddAttrsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :token, :string
    add_column :users, :email, :string
  end
end
