class ChangePasswordRequiredForUsers < ActiveRecord::Migration[5.0]

  def change
    change_column_null :users, :encrypted_password, true
  end

end
