module ApplicationHelper
	
	def visible_top_menu
		return user_top_menu if  user_signed_in?
		visitor_top_menu
	end
	
	def user_top_menu
		'user_top_menu'
	end
	
	def visitor_top_menu
		'visitor_top_menu'
	end
	
	 def gravatar_for(user, size: 120)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "http://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.fullname)
  end
	
	def show_likeable_button_for_resource(resource)
		return unlike_button_for(resource) if liked_by_user?(resource)
		like_button_for(resource)
	end
	
	def like_button_for(resource)
		link_to content_tag(:i, "Like", class:"fa fa-thumbs-up pr-2"), 
			likes_path(id: resource), method: :post,
			class:"btn btn-sm social-btn"
	end
	
	def unlike_button_for(resource)
		link_to content_tag(:i, "Unlike", class:"fa fa-thumbs-up pr-2"), 
			like_path(resource), method: :delete,
			class:"btn btn-sm unlike-btn"
	end
	
	def liked_by_user?(resource)
		resource.likes.
			find_by(user: current_user)
	end
end
