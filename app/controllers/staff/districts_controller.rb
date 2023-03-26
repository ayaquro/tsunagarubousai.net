class Staff::DistrictsController < ApplicationController
  before_action :authenticate_staff!, except: [:top, :about]
  def index
    @district = District.new
    @districts = District.all.page(params[:page])
  end

  def create
    @districts = District.all.page(params[:page])
    @district = District.new(district_params)
    if @district.save
      redirect_to request.referer #遷移元のページにリダイレクト
    else
      render :index
    end
  end

  def edit
    @district = District.find(params[:id])
  end

  def update
    @district = District.find(params[:id])
    if @district.update(district_params)
      redirect_to staff_districts_path
    else
      render :edit
    end
  end

  private

  def district_params
    params.require(:district).permit(:district_name)
  end
end
