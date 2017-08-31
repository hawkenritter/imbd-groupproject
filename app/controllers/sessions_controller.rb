class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to '/users/show'
		else
			redirect_to '/login'
	end

	def delete
		session[:user_id] = nil
		redirect_to '/login'
	end
end