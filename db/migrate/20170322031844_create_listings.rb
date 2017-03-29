class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :location
      t.integer :price
      t.string :description
      t.date :start_date
      t.date :end_date
      t.string :room_type
      t.integer :no_of_guest
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
