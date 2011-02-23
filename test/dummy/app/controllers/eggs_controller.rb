class EggsController < ApplicationController

  has_anti_spam
  
  def index
    @eggs = Egg.all
  end
  
  def new
    @egg = Egg.new
  end

  def create
    @egg = Egg.new(params[:egg].merge(:antispam => params[:antispam]))
    if @egg.save
      flash[:notice] = "Egg successfully created!"
      redirect_to eggs_path
    else
      flash[:error] = "Egg could not be saved."
      render :action => 'new'
    end
  end

end