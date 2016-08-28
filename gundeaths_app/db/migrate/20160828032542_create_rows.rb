class CreateRows < ActiveRecord::Migration
  def change
    create_table :rows do |t|
      t.string :year
      t.number :hg
      t.number :sg
      t.number :rf
      t.number :other
      t.number :combo
      t.number :noReport
      t.number :unknown

      t.timestamps null: false
    end
  end
end
