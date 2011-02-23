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
    
    puts anti_spam_valid?
    
    if @egg.save
      redirect_to eggs_path
    else
      render :action => 'new'
    end
  end

end