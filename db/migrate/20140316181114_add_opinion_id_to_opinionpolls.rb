class AddOpinionIdToOpinionpolls < ActiveRecord::Migration
  def change
    add_column :opinionpolls, :opinion_id, :int
  end
end
