class GroupsController < ApplicationController
  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to @group
    else
      render "new"
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private 

  def group_params
    params.require(:group).permit(:name)
  end

end
