class UserController < ApplicationController

  def create
  	user = User.new(user_params)
  	if user.save
  		render json: {status: 'SUCCESS',message: 'User created',data:user},status: :ok
  	else
  		render json: {status: 'ERROR',message: 'User could not be created',data:user.errors},status: :unprocessable_entity
  	end

  end

  def authenticate
  	if params[:email].present? && params[:password].present?
  		email = params[:email]
  		password = params[:password]
  		user = User.where('email=?',email).first
  		if user
  			if user.password == password
  				render json: {status: 'SUCCESS',message: 'User found',data:user},status: :ok
  			else
  				render json: {status: 'ERROR',message: 'Password not matched'}, status: :unprocessable_entity
  			end
  		else
  			render json: {status: 'ERROR',message: 'User not found'},status: :unprocessable_entity
  		end
  		
  	end
  end

  private #------------------------------
  def user_params
  	params.require(:user).permit(:first_name,:last_name,:email,:password,:gender,:date_of_birth,:country,:club_id,:team_name,:budget,:rank,:total_score)
  end


end
