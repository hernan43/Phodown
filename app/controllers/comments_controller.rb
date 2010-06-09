class CommentsController < ApplicationController
  def create
    @commentable = find_commentable  
    @comment = @commentable.comments.build(params[:comment])  
    @comment.user = current_user

    if @comment.save  
      flash[:notice] = "Successfully saved comment."  
    else  
      flash[:notice] = "There was an error please try again."  
    end 
    redirect_to :back
  end 

  protected
    def find_commentable  
      params.each do |name, value|  
        if name =~ /(.+)_id$/  
          return $1.classify.constantize.find(value)  
        end  
      end  
      nil  
    end 
end

