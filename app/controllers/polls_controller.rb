# frozen_string_literal: true

class PollsController< ApplicationController
  def show
  @poll = Poll.includes(:vote_options).find(params[:id])
end
def index
  @users = User.all
  @polls = Poll.all
  @votes = Vote.all
end





end
