class AddDetailsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string
    add_column :users, :company, :boolean
    add_column :users, :description, :string
  end
end
