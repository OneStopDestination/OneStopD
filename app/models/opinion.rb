class Opinion < ActiveRecord::Base
  default_scope :order => 'opinions.created_at DESC'
  has_many :opinionpolls, :dependent => :destroy
  validates :opinion , :presence => true ,  :length => { :maximum => 255 }
  validates :options , :presence => true

end
