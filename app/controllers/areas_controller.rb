# frozen_string_literal: true

class AreasController<ApplicationController
  before_action :set_user!
  before_action :set_area!, only: %i[show destroy edit update]

  def index
  end
  def new
    @area=@user.areas.new
  end
  def show
  end
  def create
    @area = @user.areas.build area_params
    if @area.save
      redirect_to root_path
    else
      flash.now[:alert]=t :table_no_save
      render :'areas/new', status: :unprocessable_entity
     end
  end
  def update
    @area=@user.areas
    if @area.update area_params
      respond_to do |format|
        format.html do
          flash[:notice] = 'Area edited!'
          redirect_to user_path
        end
        format.turbo_stream do
          redirect_to user_path
          flash[:notice] = 'areas edited!'
        end
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy

  end
  private
  def area_params
    params.require(:area).permit(:name,:area,:surname,:patronymic,:telephone,:kadastr,:plot_area,:address_area,:member)
  end
  def set_area!
    @area=@user.areas.find_by(params[:id])
  end
  def set_user!
    @user =current_user
  end
end

