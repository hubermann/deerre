class BusinessManagersController < ApplicationController

  layout "logued_layout"


  def index
  	#traigo el BM del user. Si no existe, creo uno.
  	@business_manager = BusinessManager.where(user_id:current_user.id)

	  	if @business_manager.count === 0 
	  		mybm = BusinessManager.new()
	  		mybm.name = "My Businnes Manager"
	  		mybm.user_id = current_user.id
	  		mybm.save
	  	end
  end

  def new
  	@business_manager = BusinessManager.new()
  end

  def create 
  	@business_manager = BusinessManager.new(bm_params)
  	if(@business_manager.save)
  		redirect_to @business_manager
  	else
  		render "new"
  	end
  end

  def show
  	@business_manager = BusinessManager.find(params[:id])	
  end

  def edit
  end

  def bm_params
  	params.require(:business_manager).permit(:title)
  end

end
