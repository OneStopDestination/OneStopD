class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :problem
  validates :comment, :presence => true, :length => { :maximum => 255 }
end
