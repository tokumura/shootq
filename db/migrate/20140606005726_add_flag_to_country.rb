class AddFlagToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :flag, :string
  end
end
