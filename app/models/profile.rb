class Profile < ActiveRecord::Base
  has_many :problems , :foreign_key => "user_id_posted", :class_name => "Problem"
  has_one :constituency, :foreign_key => "cid" , :class_name => "Problem"

  def feed
    Problem.find_all_by_cid(cid=self.constituency_id)
  end

end
