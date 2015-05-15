require 'user.rb'
require 'photo.rb'
require 'comment.rb'
class PhotosController < ApplicationController
  def index
  	@id = params[:id]
  	@name = User.find(@id).first_name + " " + User.find(@id).last_name
 	@allPics = User.find(@id).photos 
 	#redirect_to :controller => "users", :action => "index", :id => @id
  end
  def new
  	if !session[:user]
  		flash[:error] = "Nobody logged in"
  	end
  end
  def newTag
    @photo = Photo.find(params[:id])
    @id = @photo.user.id
    @users = User.all
    thisTag = Tag.new 
    thisTag.x1 = params[:xcord]
    thisTag.y1 = params[:ycord]
    thisTag.deltax = params[:deltaX]
    thisTag.deltax = params[:deltaY]
    thisTag.photo_id = params[:userId]
    thisTag.save()
  end
  def create
  	uploaded_io = params[:photo][:photo]
  	File.open(Rails.root.join('app', 'assets', 'images', uploaded_io.original_filename), 'wb') do |file|
    	file.write(uploaded_io.read)
  	end
  	if !session[:user]
  		flash[:error] = "Nobody logged in"
  	else 
	  	thisPic = Photo.new 
	  	thisPic.file_name = uploaded_io.original_filename
	  	thisPic.created_at = DateTime.now
	  	thisPic.user_id = session[:user].id
	  	thisPic.save()
	  	redirect_to :controller => "photos", :action => "index", :id => thisPic.user_id
	 end
  end
end