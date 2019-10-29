class HomeController < ApplicationController
	# skip_before_action :authenticate_user!
	before_action :intialize_timeline, only: [:index]
	def index; end;
	
	def intialize_timeline
		initialize_new_post_editor #@post.new
		@posts = Post.timeline_posts_for current_user
		#in miletsone 4 - retrieve posts comments & likes here
	end
end
