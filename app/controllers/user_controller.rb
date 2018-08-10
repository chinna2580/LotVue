class UserController < ApplicationController

	def index
		# @roles =  Role.where(is_hidden: false).pluck(:id)
		# @user_roles =  UserRole.where(roles_id: @roles).pluck(:users_id).uniq
		# @users = User.where(id: @user_roles)
		# render json: @users
	end

	def show_all_users
		@roles =  Role.where(is_hidden: false).pluck(:id)
		@user_roles =  UserRole.where(roles_id: @roles).pluck(:users_id).uniq
		@users = User.where(id: @user_roles)
		render json: @users
		# respond_to do |format|
  #     # format.html { redirect_to '/users/show_all_users' }
  #     # format.json { head :no_content }
  #     format.js   { render json: @users }
  #  	end
	end

	def create
		@user_exists =  User.find_by(email: user_params[:email])
		return render json: 'user already exists' unless @user_exists.nil?
		@user = User.new(user_params)
		if @user.save
			role_ids =  params[:user][:role_ids].reject { |c| c.empty? }
			role_ids.each do |role_id|
				@user_roles =  UserRole.create(users_id: @user[:id], roles_id: role_id)
			end
			# render json: @user
			redirect_to 'users/index'
		else
			render json: params
		end
	end

	def new
		@roles =  Role.where(is_hidden: false)
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email)
	end
end
