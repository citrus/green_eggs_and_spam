class CommentsController < ApplicationController

  has_anti_spam
  
  def new
  end

  def create
    if anti_spam_valid?
      flash[:notice] = "Comment sent!"
      redirect_to new_comment_path
    else
      flash[:error] = GreenEggsAndSpam.options[:error_message]
      render :action => 'new'
    end
  end

end