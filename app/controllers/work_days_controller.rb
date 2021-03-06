class WorkDaysController < ApplicationController
  def index
    @work_days = WorkDay.where(user_id: current_user.id)
  end

  def show
    @work_day = WorkDay.where(id: params[:id], user_id: current_user.id).first
  end

  def new
    @work_day = WorkDay.new
  end

  def create
    @work_day = WorkDay.new

    if @work_day.save
      redirect_to 'index'
    else
      render 'new'
    end
  end

  def edit
    @work_day = WorkDay.find(params[:id])
  end

  def update
    @work_day = WorkDay.find(params[:id])

    if @work_day.update_attributes
      redirect_to 'index'
    else
      render 'edit'
    end
  end

  private

  def work_day_params
    params.require(:work_day).permit(:work_date).merge(:user_id)
  end
end
