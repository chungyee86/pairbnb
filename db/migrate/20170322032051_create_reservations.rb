class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.date :check_in
      t.date :check_out
      t.references :user, foreign_key: true, index: false
      t.references :listing, foreign_key: true, index: false

      t.timestamps
    end
  end
end
