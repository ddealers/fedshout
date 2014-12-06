class EntitiesController < ApplicationController
  def index
  	@entities = Entity.all.order(name: :asc)
  	render json: @entities
  end

  def show
  	@entity = Entity.find params[:id]
  	render json: @entity
  end

  def members
  	@entity = Entity.find params[:entity_id]
  	@members = @entity.members
  	render json: @members
  end
end
