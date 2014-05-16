class CreateBetFirsts < ActiveRecord::Migration
  def change
    create_table :bet_firsts do |t|
      t.string :match_code
      t.string :score_l
      t.string :score_r
      t.string :group
      t.integer :user_id

      t.timestamps
    end
  end
end
