class BusinessManagersController < ApplicationController

  layout "logued_layout"


  def index
  	#traigo el BM del user. Si no existe, creo uno.
  	@business_manager = BusinessManager.where(user_id: current_user.id)

	  	if @business_manager.count === 0 
        #creo el BM por default
	  		mybm = BusinessManager.new()
	  		mybm.name = "My Businnes Manager"
	  		mybm.user_id = current_user.id
	  		mybm.save

        #creo un grupo por default
        myGroup = Grupo.new()
        myGroup.name = "My default Group"
        myGroup.group_id = mybm.id
        myGroup.save
        
        #creo una cuenta por default
        myAccount = Account.new()
        myAccount.name = "My default account"
        myAccount.group_id = myGroup.id
        myAccount.save

	  	end


  end

  def show
    @business_manager = BusinessManager.where(business_manager_id params[:id])
    
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
