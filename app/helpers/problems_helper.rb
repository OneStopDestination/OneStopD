module ProblemsHelper

  def problems_for_user(user)
    cons = Constituency.find_by_name(user.constituency)
    @user_problems = Problem.find_all_by_cid(cid=cons.id)
    puts("++++++++++++++++",@user_problems)
    #@cons_problems = Problem.find_all_by_cid(cid=user.constituency && user_id_posted!=user.id)
    #@all_problems = @user_problems.merge(@cons_problems)
    puts (@user_problems)
    return @user_problems
  end

end
