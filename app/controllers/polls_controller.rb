# frozen_string_literal: true

class PollsController< ApplicationController
  def show
  @poll = Poll.includes(:vote_options).find_by(params[:id])
end
def index
  @polls = Poll.all
end





end
