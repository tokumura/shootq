class AddMatchDateToBetFirst < ActiveRecord::Migration
  def change
    add_column :bet_firsts, :match_date, :string
  end
end
