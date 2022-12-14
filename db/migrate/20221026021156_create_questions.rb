class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text          :question_text, null: false
      t.references    :user,          null: false, foreign_key: true
      t.references    :fish,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
