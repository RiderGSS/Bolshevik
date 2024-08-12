# frozen_string_literal: true

class Admin::PollsController<ApplicationController
  before_action :set_poll! ,only: %i[destroy edit update show]

  def show
  end
  def index
    @polls = Poll.all
  end

  def new
    @poll = Poll.new
  end
  def edit

  end

  def update
    if @poll.update poll_params
      respond_to do |format|
        format.html do
          flash[:success] = 'Poll edited!'
          redirect_to admin_polls_path
        end
        format.turbo_stream do
          @poll
          flash[:success] = 'Poll edited!'
        end
      end
    else
      render :edit, status: :unprocessable_entity
    end

  end
  def create
    @poll = Poll.new(poll_params)
    if @poll.save
          flash[:success] = 'Poll was created!'
          redirect_to admin_polls_path
    else
      render 'new',status: :unprocessable_entity
    end

  end
  def destroy

    if @poll.destroy
      respond_to do |format|
        format.html do
          flash[:success] = 'Poll was destroyed!'
          redirect_to admin_poll_path, status: see_other
        end
        format.turbo_stream {flash.now[:success] = 'Poll was destroyed!'}
      end
    else
      flash[:warning] = 'Error destroying poll...'
    end
  end

  private

  def poll_params
    params.require(:poll).permit(:topic,vote_options_attributes: [:id, :title, :_destroy])
  end
  def set_poll!

    @poll=Poll.includes(:vote_options).find(params[:id])
  end

end
