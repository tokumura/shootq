class CreateTournamentFirsts < ActiveRecord::Migration
  def change
    create_table :tournament_firsts do |t|
      t.string :match_code
      t.string :score_l
      t.string :score_r

      t.timestamps
    end
  end
end
