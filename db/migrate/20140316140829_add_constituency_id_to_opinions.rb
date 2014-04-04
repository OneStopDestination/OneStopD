class AddConstituencyIdToOpinions < ActiveRecord::Migration
  def change
    add_column :opinions, :constituency_id, :integer
  end
end
