class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.integer :cid
      t.string :category
      t.boolean :resolved
      t.integer :user_id_posted
      t.integer :user_id_resolved
      t.integer :rating
      t.text :resolution

      t.timestamps
    end
  end
end
