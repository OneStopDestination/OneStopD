class AddUserIdCreatedToOpinions < ActiveRecord::Migration
  def change
    add_column :opinions, :user_id_created, :integer
  end
end
