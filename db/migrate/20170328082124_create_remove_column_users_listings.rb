class CreateRemoveColumnUsersListings < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :avatar, :string
  	remove_column :listings, :avatars, :json
  end
end
