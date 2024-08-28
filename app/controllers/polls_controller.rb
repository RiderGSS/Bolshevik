# frozen_string_literal: true

class PollsController< ApplicationController
  before_action :set_area!
  def show
  @poll = Poll.includes(:vote_options).find(params[:id])
end
def index
  @users = User.all
  @polls = Poll.includes(:vote_options).all
  @votes = Vote.all
end

  private
  def set_area!

       @area=current_user.areas.find(current_user.id)
  end




end
