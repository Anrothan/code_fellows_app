class UsersController < ApplicationController

	def new
		@user_list = User.all
		@user = User.new

	end

	def create
		@user = User.new(user_params)
		if @user.save
			# Flash message confirming success
			redirect_to signup_path
		else
			render 'new'
		end
	end

	def index
		@user_list = User.all # This is an array
	end

	def show
		@user = User.find(params[:id])
	end

	private

		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
end
