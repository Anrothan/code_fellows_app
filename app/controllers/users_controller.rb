class UsersController < ApplicationController

	before_action :signed_in_user, only: [:edit, :update, :destroy]
	before_action :correct_user?, only: [:edit, :update, :destroy]


	def new
		@user_list = User.all
		@user = User.new

	end

	def create
		@user_list = User.all 
		@user = User.new(user_params)
		if @user.save
			sign_in @user
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

	end

	def update
		if @user.update(user_params)
			flash[:success] = "User information updated"
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id]).destroy
		redirect_to signup_path
	end

	private

		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
		end

		def signed_in_user
			redirect_to signin_path, notice: "You must be signed in for access" unless signed_in?
		end

		def correct_user?
			@user = User.find(params[:id])
			redirect_to @user, notice: "You are not signed in as this user" unless current_user?(@user)
		end
end
