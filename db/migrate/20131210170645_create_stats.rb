class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.text :data
      t.timestamp :time

      t.timestamps
    end
  end
end
