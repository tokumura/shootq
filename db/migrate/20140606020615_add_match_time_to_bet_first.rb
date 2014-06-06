class AddMatchTimeToBetFirst < ActiveRecord::Migration
  def change
    add_column :bet_firsts, :match_time, :string
  end
end
