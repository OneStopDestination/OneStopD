class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.integer :mob_no
      t.string :constituency

      t.timestamps
    end
  end
end
