class CreateQuestion < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :text
      t.integer :best_answer_id
      t.references :user
      t.integer :vote_count
      t.timestamps
    end
  end
end
