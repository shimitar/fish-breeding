class CreateBreedings < ActiveRecord::Migration[6.0]
  def change
    create_table :breedings do |t|
      t.string     :tank_size
      t.string     :temperature
      t.string     :filter
      t.string     :raito
      t.string     :condition
      t.string     :sand
      t.string     :plant
      t.references :user,             null: false, foreign_key: true
      t.references :fish,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
