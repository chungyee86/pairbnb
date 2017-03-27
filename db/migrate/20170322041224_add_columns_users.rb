class AddColumnsUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :phone, :integer
    add_column :users, :birthdate, :date 
  end
end
