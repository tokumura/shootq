class AddUserIdToTournamentFirst < ActiveRecord::Migration
  def change
    add_column :tournament_firsts, :user_id, :integer
  end
end
