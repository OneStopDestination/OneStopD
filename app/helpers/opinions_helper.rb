module OpinionsHelper

  def opinions_for_cons(user)
    cons = Constituency.find_by_name(user.constituency)
    @opinion_polls = Opinion.find_all_by_constituency_id(constituency_id=cons)
    puts (@opinion_polls)
    return @opinion_polls
  end
end
