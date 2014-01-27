class Problem < ActiveRecord::Base
  belongs_to :profile
  belongs_to :user
  has_many :comments, :dependent => :destroy
end
