class CreateResponse < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :text
      t.references :respondable, :polymorphic => true
      t.references :user
      t.timestamps
    end
  end
end
