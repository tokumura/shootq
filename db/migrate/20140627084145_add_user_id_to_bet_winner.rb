class AddUserIdToBetWinner < ActiveRecord::Migration
  def change
    add_column :bet_winners, :user_id, :integer
  end
end
