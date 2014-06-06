class AddGroupNameToBetFirst < ActiveRecord::Migration
  def change
    add_column :bet_firsts, :group_name, :string
  end
end
