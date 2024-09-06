# frozen_string_literal: true

class IndicatorsController< ApplicationController
  before_action :set_area!
  before_action :set_indicators!

  def index
  end
  def new
    @indicator =  @area.indicators.new
  end



  def create
    @indicator =@area.indicators.build ind_params
      if @indicator.save

      respond_to do |format|
       format.html do
        flash[:notice] = 'Poll was created!'
       redirect_to area_indicators_path(current_user)
       end
       format.turbo_stream do


         end
      end
      else
        flash[:success]= @indicator.errors.full_messages
        redirect_to new_area_indicator_path(@area)
    end
  end

  private



  private
  def ind_params
    params.require(:indicator).permit(:ind)
  end
  def set_area!
    @area = current_user.areas.find(current_user.id)
  end
  def set_indicators!
    @indicators=@area.indicators.order(created_at: :desc)
  end



  def calc
    indications = @area.indicators.order('created_at desc').limit(2)
    ind=indications.last[:ind].to_f
    ind_pref = indications.second_to_last[:ind].to_f
    result=ind_pref-ind


  end
end
