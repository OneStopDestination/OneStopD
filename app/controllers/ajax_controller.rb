class AjaxController < ApplicationController
  def users
    if params[:term]
      like= "%".concat(params[:term].concat("%"))
      @user_items = Profile.where("name like ?", like).limit(10)
    else
      @user_items = Profile.all
    end
    list = @user_items.map {|u| Hash[ id: u.id, link: profile_path(u),label: u.name ]}
    puts (list)
    render json: list
  end
end

