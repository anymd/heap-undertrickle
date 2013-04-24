class CreateVote < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :voteable, :polymorphic => true
      t.references :user
      t.boolean :vote, :default => nil
      t.timestamps
    end
  end  
end
