module CommentsHelper
	

	
	def show_likeable_link_for(resource)
		return unlike_comment_link(resource) if liked_by_user?(resource)
		like_comment_link(resource)
	end
	
	def like_comment_link(resource)
		link_to 'Like', likes_path(comment_id: resource.id), method: :post, class:"pr-1"
	end
	
	def unlike_comment_link(resource)
		link_to 'Unlike', likes_path(comment_id: resource.id), method: :post, class:"pr-1 text unlike-link"
	end
end
