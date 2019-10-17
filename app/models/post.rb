class Post < ApplicationRecord
	belongs_to :user
	
	scope :authored_by, ->(user) {where(user_id: user).order(updated_at: :desc)}
	
	validates :content, presence: true
	
	
	def self.timeline_posts_for(user)
		#in milestone 5>> modify to include posts from current_user's friendsr)
		authored_by(user).order(updated_at: :desc)
	end
	
	def update_post (post_params)
		if update_attributes post_params
			set_flash_notice 'notice', 'Post updated'
			redirect_back fallback_location: root_path
		else
			set_flash_notice 'notice', 'Post updated'
		end
	end
	
	
end
