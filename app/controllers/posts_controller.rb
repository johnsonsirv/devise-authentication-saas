class PostsController < ApplicationController
	before_action :get_timeline_posts, only: [:index]
	before_action :initialize_new_post_editor, only: [:index]
	
  def index ;  end ;
	
	def create
		save_post post_params
	end
	
	def edit
	end
	
	def update
	end
	
	def destroy
	end

	private
	def get_timeline_posts
		@posts = Post.all #in milestone 5>> modify to include posts from current_user's friends
	end
	
	def save_post(post_params)
		@post = current_user.add_new_post(post_params)
		if @post.errors.any?
			#decision here, come back
			set_flash_notice 'alert', 'Post could not be saved. Did you forget to write something?'
			redirect_back fallback_location: root_path
		else
			set_flash_notice 'notice', 'Post added successfully'
			initialize_new_post_editor
			redirect_back fallback_location: root_path
		end
	end
	
	def post_params
			params.require(:post).permit(:content)
	end
end
