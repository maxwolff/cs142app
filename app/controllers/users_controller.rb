require 'user.rb'
require 'photo.rb'
require 'comment.rb'
class UsersController < ApplicationController
	def index
		@users = User.all
	end
	def login
	end
	def post_login	
		@loggedOn = User.find_by_login(params[:login]);
		if @loggedOn != nil 
			if @loggedOn.password_valid?(params[:password])
				session[:user] = @loggedOn
				id = session[:user].id
				redirect_to :controller => "photos", :action => "index", :id => id
			else 
				flash[:error] = "Invalid Password"
				redirect_to :back
			end
		else
			flash[:error] = "Username not found"
			redirect_to :back
		end
	end
	def logout
		reset_session
		redirect_to "/users/login"
	end
	def new 
	end 
	def create 
		if params[:password1] == params[:password2] and User.find_by_login(:login) == nil
			newUser = User.new
			newUser.first_name = params[:first]
			newUser.last_name = params[:last]
			newUser.login = params[:login]
			newUser.password = params[:password1]
			if newUser.save()
				redirect_to :controller => "users", :action => "login"
			else
				flash[:error] = "failed to create user"
				redirect_to :controller => "users", :action => "new"
			end
		else
			redirect_to :controller => "users", :action => "new"
		end
	end
	def filter
		@results = Search.filter(params[:substring])
		render :json => @results
	end
end