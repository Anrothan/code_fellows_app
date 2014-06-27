class UsersController < ApplicationController

	def new
		@user_list = User.all
		@user = User.new

	end

	def create
		@user_list = User.all 
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "New user successfully registered"
			redirect_to signup_path
		else
			render 'new'
		end
	end

	 def index
	# 	This job is currently done by "new". A separate index view would be 
	#   redundant without it providing additional value, which it currently does not. 
		redirect_to signup_path
	 end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "User information updated"
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to signup_path
	end

	private

		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
		end
end
