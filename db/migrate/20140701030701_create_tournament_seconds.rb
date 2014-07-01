class CreateTournamentSeconds < ActiveRecord::Migration
  def change
    create_table :tournament_seconds do |t|
      t.string :match_code
      t.string :score_l
      t.string :score_r
      t.integer :user_id

      t.timestamps
    end
  end
end
