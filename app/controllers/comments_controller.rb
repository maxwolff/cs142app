class CommentsController < ApplicationController
#   displays a form where a user 
#   can add a comment for the photo whose primary key is id.
  def new
  	if Photo.exists?(params[:id])
	  	@id = params[:id]
	  	@thisPhoto = Photo.find(@id)
	else
		flash[:error] = "No parameter??" 	
  	end
  end
  def create
  	if !session[:user]
  		flash[:error] = "Nobody logged in"
  	else 
	  	comment = Comment.new
	  	comment.photo = Photo.find(params[:id])
	  	comment.user = session[:user]
	  	comment.date_time = Time.now
	  	comment.comment = params[:comment]
	  	comment.save()
  		redirect_to :controller => "photos", :action => "index", :id => session[:user].id
  	end
  end 
end
