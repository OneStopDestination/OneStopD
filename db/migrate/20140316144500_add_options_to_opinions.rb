class AddOptionsToOpinions < ActiveRecord::Migration
  def change
    add_column :opinions, :options, :string
  end
end
