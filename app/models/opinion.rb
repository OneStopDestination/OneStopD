class Opinion < ActiveRecord::Base
  default_scope :order => 'opinions.created_at DESC'
  has_many :opinionpolls, :dependent => :destroy
end
