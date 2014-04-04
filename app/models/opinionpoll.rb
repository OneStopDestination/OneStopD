class Opinionpoll < ActiveRecord::Base
  validates_uniqueness_of :user_id_voted, :scope => [:opinion_id ]
  validates(:option_selected , :presence => true)
end
