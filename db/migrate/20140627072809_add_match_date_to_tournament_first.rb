class AddMatchDateToTournamentFirst < ActiveRecord::Migration
  def change
    add_column :tournament_firsts, :match_date, :string
  end
end
