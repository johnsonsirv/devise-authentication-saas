class Post < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :likes, as: :likeable, dependent: :destroy
	
	scope :authored_by, ->(user) { where(user_id: user).includes(:user).order(updated_at: :desc).
			includes(:comments)}
	
	default_scope -> { includes(:likes)}
	
	validates :content, presence: true
	
	
	def self.timeline_posts_for(user)
		authored_by(user).order(updated_at: :desc)
	end
	
	def update_post (post_params)
		if update_attributes post_params
			'Post updated'
		else
			'Post update failed'
		end
	end
	
	
end
