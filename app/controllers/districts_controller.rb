class DistrictsController < ApplicationController
  def index
    if params[:cabecera]
      if params[:distrito]
        @districts = District.where("head LIKE :head AND num = :district", {:head => "%"+params[:cabecera]+"%", :district => params[:distrito]})
      else
        @districts = District.where("head LIKE :head", {:head => "%"+params[:cabecera]+"%"})
      end
    else
      @districts = District.all.order(head: :asc)
    end
  	render json: @districts
  end

  def show
  	@district = District.find params[:id]
  	render json: @district
  end

  def member
  	@district = District.find params[:district_id]
  	@member = @district.member
  	render json: @member
  end
end
