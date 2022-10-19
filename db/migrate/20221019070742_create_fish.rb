class CreateFish < ActiveRecord::Migration[6.0]
  def change
    create_table :fish do |t|
      t.string     :name,     null: false
      t.string     :size,     null: false
      t.text       :fish_text, null: false
      t.integer    :category_id, null: false
      t.references :user,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
