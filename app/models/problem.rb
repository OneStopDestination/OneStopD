class Problem < ActiveRecord::Base
  belongs_to :profile
  belongs_to :user
  has_many :comments, :dependent => :destroy
  default_scope :order => 'problems.created_at DESC'
  validates :description, :presence => true, :length => { :maximum => 255 }
end
