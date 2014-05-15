class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.string :name
      t.integer :point_first
      t.integer :point_second
      t.integer :point_third
      t.integer :point_total

      t.timestamps
    end
  end
end
