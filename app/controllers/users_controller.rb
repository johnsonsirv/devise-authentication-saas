class UsersController < ApplicationController
  
	def index
		@users = User.all_except current_user
  end

  def show
		@user = find_user
  end
	
	private
	def find_user
		User.find_by(id: params[:id])
	end
end
