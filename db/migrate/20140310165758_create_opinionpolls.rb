class CreateOpinionpolls < ActiveRecord::Migration
  def change
    create_table :opinionpolls do |t|
      t.string :description
      t.integer :user_id_created
      t.integer :user_id_voted
      t.string :option_selected
      t.string :options
      t.integer :constituency_id

      t.timestamps
    end
  end
end
