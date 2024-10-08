# frozen_string_literal: true

class VotesController<ApplicationController
  def create

    if current_user && params[:poll] && params[:poll][:id] && params[:vote_option] && params[:vote_option][:id]
      @poll = Poll.find_by_id(params[:poll][:id])
      @option = @poll.vote_options.find(params[:vote_option][:id])
      if @option && @poll && !current_user.voted_for?(@poll)
        @option.votes.create({user_id: current_user.id})
        flash[:notice] = "Answer created!"
        redirect_to polls_path
      else
        flash[:notice] = "Your vote cannot be saved. Have you already voted?"
      end
    else
      flash[:notice] ="Your vote cannot be saved."
    end
  end
end
