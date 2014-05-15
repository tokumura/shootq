class ChangeIndexFromEmailToNameOnUsers < ActiveRecord::Migration
  def change
    remove_index :users, :email
    add_index :users, :account
  end
end
