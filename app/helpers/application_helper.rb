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
	
	def liked_by_user?(resource)
		resource.likes.
			find_by(user: current_user)
	end
  
  def count_friend_request
    return Friendship
    .unconfirmed_friends_for(current_user)
    .size if has_request?
    
    ''
  end
  
  def has_request?
    Friendship
    .unconfirmed_friends_for(current_user).any?
  end
  
  def friend_requests_for(user)
     return Friendship
    .unconfirmed_max_friends_for(user, 5)
  end 
  
  def show_friend_request_icon
    return link_to content_tag(:i, count_friend_request, 
      class: 'fa fa-users has-request'), 
    friend_requests_path, 
    title: "#{pluralize(count_friend_request, 'Friend request')}", 
    class: 'nav-link' if has_request?
    
    link_to content_tag(:i, '', 
    class: 'fa fa-users'), 
    friend_requests_path,
    title: 'No Friend request',
    class: 'nav-link'
  end
end
