class MembersController < ApplicationController
  def index
  	if params[:entidad]
  		@entity = Entity.find_by name: params[:entidad]
  		@members = @entity.members
  		render json: @members
  		return
  	end
  	if params[:cabecera]
  		@members = []
  		if params[:distrito]
  			@districts = District.where("head LIKE :head AND num = :district", {:head => "%"+params[:cabecera]+"%", :district => params[:distrito]}).each do |district|
	  			@members.push(district.member)
	  		end
	  	else
	  		@districts = District.where("head LIKE :head", {:head => "%"+params[:cabecera]+"%"}).each do |district|
	  			@members.push(district.member)
	  		end
	  	end
  		render json: @members
  		return
  	end
  	if params[:distrito]
  		@members = []
  		@districts = District.where("num = :id", {:id => params[:distrito]}).each do |district|
  			@members.push(district.member)
  		end
  		render json: @members
  		return
  	end
  	@members = Member.all
  	render json: @members
  end

  def show
  	@member = Member.find(params[:id])
  	render json: @member
  end
end
