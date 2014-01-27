class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.text :education
      t.text :profile_pic
      t.text :about
      t.text :manifesto
      t.integer :pid
      t.string :user_id
      t.integer :constituency_id

      t.timestamps
    end
  end
end
