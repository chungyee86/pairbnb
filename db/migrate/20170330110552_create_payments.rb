class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
    	t.references :reservation, index: true
      	t.string :braintree_payment_id
      	t.string :status
      	t.string :fourdigit

      	t.timestamps null: false
    end
  end
end
