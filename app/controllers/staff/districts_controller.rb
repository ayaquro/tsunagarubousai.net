class Staff::DistrictsController < ApplicationController
  def index
    @district = District.new
    @districts = District.all
  end

  def create
    district = District.new(district_params)
    district.save
    redirect_to request.referer #遷移元のページにリダイレクト
  end

  def edit
    @district = District.find(params[:id])
  end

  def update
    district = District.find(params[:id])
    district.update(district_params)
    redirect_to staff_districts_path
  end

  private

  def district_params
    params.require(:district).permit(:district_name)
  end
end
