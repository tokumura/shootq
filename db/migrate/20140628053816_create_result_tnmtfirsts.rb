class CreateResultTnmtfirsts < ActiveRecord::Migration
  def change
    create_table :result_tnmtfirsts do |t|
      t.string :match_code
      t.string :score_l
      t.string :score_r

      t.timestamps
    end
  end
end
