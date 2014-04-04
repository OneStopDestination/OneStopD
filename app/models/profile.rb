class Profile < ActiveRecord::Base
  has_many :problems , :foreign_key => "user_id_posted", :class_name => "Problem"
  has_many :opinions , :foreign_key => "user_id_created", :class_name => "Opinion"
  has_one :constituency, :foreign_key => "cid" , :class_name => "Problem"

  def feed
    Problem.find_all_by_cid(cid=self.constituency_id)
  end
  def opinions_feed
    Opinion.find_all_by_constituency_id(self.constituency_id)
  end

end
