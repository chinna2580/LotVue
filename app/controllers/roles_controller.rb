class RolesController < ApplicationController
	def index
		@roles = Role.where(is_hidden: false)
		# render json: @roles  #Roles.all
	end

	def create
		role_params[:is_hidden] = false
		@role = Role.new(role_params)
		if @role.save
			flash[:success] = 'role created'
			redirect_to '/roles/index'
		else
			flash[:danger] = 'role created'
			redirect_to '/roles/index'
		end
	end

	def hide_roles
		if request.post?
			role_ids_to_hide = []
			params[:role_ids].keys.each do |role_id|
				if params[:role_ids][role_id] ==  "1"
					role_ids_to_hide.push role_id
				end
				# puts role_id
			end
			# puts role_ids_to_hide.inspect
			@roles = Role.where(id: role_ids_to_hide)
			if @roles.update(is_hidden: true)
				redirect_to '/roles/index'
				# render json: @roles
			else
				redirect_to '/roles/index'
				# render json: @roles
			end
			# render json: params
		else
			@roles =  Roles.where(is_hidden: false)
		end
	end


	private
	def role_params
		params.require(:role).permit(:role_name, :is_hidden)
	end
end
