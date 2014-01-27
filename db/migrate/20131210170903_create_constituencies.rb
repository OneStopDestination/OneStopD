class CreateConstituencies < ActiveRecord::Migration
  def change
    create_table :constituencies do |t|
      t.string :name
      t.integer :cid
      t.string :current_MLA

      t.timestamps
    end
  end
end
