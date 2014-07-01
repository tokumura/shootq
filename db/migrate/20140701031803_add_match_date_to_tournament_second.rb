class AddMatchDateToTournamentSecond < ActiveRecord::Migration
  def change
    add_column :tournament_seconds, :match_date, :string
  end
end
