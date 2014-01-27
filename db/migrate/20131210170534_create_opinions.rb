class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.text :opinion
      t.integer :pid

      t.timestamps
    end
  end
end
