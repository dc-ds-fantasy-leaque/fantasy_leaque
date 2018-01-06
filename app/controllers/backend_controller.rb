class BackendController < ActionController::Base

	before_action :instantiate

	def index
		@resp[0] = User.all
		@resp[1] = Club.all
		@resp[2] = Player.all
		@resp[3] = AdminUser.all
	end

	def login
	end

	def attempt_login
		if params[:username].present? && params[:password].present?
			user = AdminUser.where(:username => params[:username]).first
			if !user.nil? && user.password == params[:password]
				session[:user_id] = user.id
				redirect_to :action => "index"
			else
				redirect_to :action => "login"
			end
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to :action => "login"
	end

	def new_admin
		@resp[0] = AdminUser.new(admin_user_params)
	end

	def create_admin
		@resp[0] = AdminUser.new(admin_user_params)
		if @resp[0].save
			flash[:message] = "Admin user created"
			redirect_to :action => "index"
		else
			flash[:message] = "Admin user could not be created."
			redirect_to :action => "index"
		end
	end

	def new_player
		@resp[0] = Player.new()
	end

	def create_player
		@resp[0] = Player.new(player_params)
		if @resp[0].save
			redirect_to :action => "view_club", :id => @resp[0].club_id
		else
			redirect_to :action => "new_player"
		end
	end

	def new_club
		@resp[0] = Club.new(club_params)
	end

	def create_club
		@resp[0] = Club.new(club_params)
		if @resp[0].save
			redirect_to :action => "clubs"
		else
			redirect_to :action => "new_club"
		end
	end

	def clubs
		@resp[0] = Club.all
	end

	def view_club
		@resp[0] = Club.preload(:players).find(params[:id])
	end


	private #-----------------------------

	def instantiate
		@resp = []
	end

	def player_params
		params.permit(:name,:photo,:club_id,:position,:date_of_birth,:national_team,:appearences,:wins,:losses,:draws,:pl_debut,:goals,:assists,:yellow_cards,:red_cards,:penalty_conceded,:penalty_saved,:clean_sheets)
	end

	def club_params
		params.permit(:name,:manager_name,:stadium_name,:logo)
	end

	def admin_user_params
		params.require(:admin_user).permit()
	end


end