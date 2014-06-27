class CreateResultSeconds < ActiveRecord::Migration
  def change
    create_table :result_seconds do |t|
      t.string :group_name
      t.string :countries

      t.timestamps
    end
  end
end
