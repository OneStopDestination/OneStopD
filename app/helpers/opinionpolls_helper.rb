module OpinionpollsHelper
  def opionionpolls_for_cons(user)
    cons = Constituency.find_by_name(user.constituency)
    @opinion_polls = Opinionpoll.find_all_by_constituency_id(constituency_id=cons)
    puts (@opinion_polls)
    @option1 =  Opinionpoll.where()
    return    @opinion_polls
  end

  def voted(uid,opinion_id)
    @testval = Opinionpoll.where("user_id_voted=? AND opinion_id=?",uid,opinion_id)
    return @testval.blank?
  end
end

