class Post < ApplicationRecord
	belongs_to :user
	
	scope :authored_by, ->(user) {where(id: user).order(updated_at: :desc)}
	
	validates :content, presence: true
	
	
end
