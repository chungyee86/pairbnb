class AddColumnsListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :state, :string
    add_column :listings, :country, :string
    add_column :listings, :name, :string
  end
end
