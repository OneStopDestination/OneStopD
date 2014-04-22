class AddFbflagToUser < ActiveRecord::Migration
  def change
    add_column :users, :fbflag, :boolean
  end
end
