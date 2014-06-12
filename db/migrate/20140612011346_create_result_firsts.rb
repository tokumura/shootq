class CreateResultFirsts < ActiveRecord::Migration
  def change
    create_table :result_firsts do |t|
      t.string :match_date
      t.string :dayofweek
      t.string :match_time
      t.string :group_name
      t.string :match_code
      t.string :score_l
      t.string :score_r

      t.timestamps
    end
  end
end
