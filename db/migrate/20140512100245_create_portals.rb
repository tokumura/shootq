class CreatePortals < ActiveRecord::Migration
  def change
    create_table :portals do |t|

      t.timestamps
    end
  end
end
