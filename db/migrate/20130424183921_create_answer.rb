class CreateAnswer < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :text
      t.references :question
      t.references :user
      t.integer :vote_count
      t.timestamps
    end
  end
end
