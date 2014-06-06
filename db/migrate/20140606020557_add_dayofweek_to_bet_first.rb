class AddDayofweekToBetFirst < ActiveRecord::Migration
  def change
    add_column :bet_firsts, :dayofweek, :string
  end
end
