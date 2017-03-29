class AddColumnListings < ActiveRecord::Migration[5.0]
  def change
  	add_column :listings, :name, :string
  end
end
