class CreateBetWinners < ActiveRecord::Migration
  def change
    create_table :bet_winners do |t|
      t.string :winner_first
      t.string :winner_second
      t.string :winner_third

      t.timestamps
    end
  end
end
