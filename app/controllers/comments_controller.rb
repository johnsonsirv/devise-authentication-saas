class CommentsController < ApplicationController
	
	def create
		save_comment comment_params
	end
	
	def destroy
		
	end
	
	
	private 
	def save_comment(comment_params)
		@comment = current_user.add_new_comment(comment_params)
		if @comment.errors.any?
			set_flash_notice 'alert', 'Comment could not be saved. Did you forget to write something?'
			redirect_back fallback_location: root_path
		else
			set_flash_notice 'notice', 'Comment added successfully'
			redirect_back fallback_location: root_path
		end
	end
	
	def comment_params
		params.require(:comment).permit(:content, :post_id)
	end
end
