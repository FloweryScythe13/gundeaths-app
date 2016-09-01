class CreateRows < ActiveRecord::Migration
  def change
    create_table :rows do |t|
      t.string :year
        t.integer :hg
        t.integer :sg
        t.integer :rf
        t.integer :other
        t.integer :combo
        t.integer :noReport
        t.integer :unknown

      t.timestamps null: false
    end
  end
end
