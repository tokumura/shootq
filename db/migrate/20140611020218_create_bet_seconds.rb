class CreateBetSeconds < ActiveRecord::Migration
  def change
    create_table :bet_seconds do |t|
      t.string :a1
      t.string :a2
      t.string :b1
      t.string :b2
      t.string :c1
      t.string :c2
      t.string :d1
      t.string :d2
      t.string :e1
      t.string :e2
      t.string :f1
      t.string :f2
      t.string :g1
      t.string :g2
      t.string :h1
      t.string :h2
      t.integer :user_id

      t.timestamps
    end
  end
end
