class LikesController < ApplicationController
	before_action :get_resource_to_be_liked
	
	def create
		Like.add_like_to_resource(@likeable, current_user)
		redirect_to back_with_anchored_resource anchor: @likeable.id
	end
	
	def destroy
		Like.unlike_resource(@likeable, current_user)
		redirect_to back_with_anchored_resource anchor: @likeable.id
	end
	
	private
	def get_resource_to_be_liked
		return if (@likeable = Post.find_by_id(params[:id]) ||
			 @likeable = Comment.find_by_id(params[:id]) )
		set_flash_notice 'alert', 'Resource not found'
		redirect_back fallback_location: root_path
	end
	
end
