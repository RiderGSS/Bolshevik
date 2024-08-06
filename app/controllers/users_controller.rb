# frozen_string_literal: true

class UsersController<ApplicationController
  before_action :set_area!
  def show
    @user = current_user
  end

  private
  def set_area!
    @area=current_user.areas.find_by(params[:id])
  end
end
