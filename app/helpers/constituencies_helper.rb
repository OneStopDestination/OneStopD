module ConstituenciesHelper
  def get_constituency
    return Constituency.all(:select => "name").collect{|p| p.name}
   end
end
