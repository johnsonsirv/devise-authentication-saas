module UsersHelper
	
	def show_banner_call_to_action_for(user)
		return update_info_btn if current_user == user
    
    return pending_friendship_btn(user) if current_user
    .has_pending_friend_request_to?(user)
		
    return accept_friend_request_btns(user) if current_user
    .has_pending_friend_request_from?(user)
    
    return unfriend_btn(user) if current_user.friends_with?(user)
		
    friendship_btn(user)
	end
	
	def update_info_btn
		link_to 'Update Info', '#', class: "btn btn-timeline-friend", title: "Update Info"
	end
	
	def friendship_btn(user)
		link_to 'Add Friend', friendships_path(other_user: user),  
    method: :post, 
    class: "btn btn-timeline-friend", 
    title: "Send friend Request"
	end
  
  def pending_friendship_btn(user)
    link_to 'Friend Request sent', friendship_path(user),  
    method: :delete, 
    data: { confirm: 'Are you sure you want to remove this request?' },
    class: "btn btn-timeline-friend", 
    title: "Delete friend request"
  end
  
  def accept_friend_request_btns(user)
    "#{confirm_friendship_btn(user)}
    #{delete_friendship_btn(user)}".html_safe
  end
  
  def confirm_friendship_btn(user)
    link_to 'Confirm Friend', friendship_path(user),  
    method: :patch, 
    class: "btn btn-timeline-friend", 
    title: "Confirm friend request"
  end
  
   def delete_friendship_btn(user)
    link_to 'Remove Request', friendship_path(user),  
    method: :delete, 
    data: { confirm: 'Are you sure you want to remove this request?' },
    class: "btn btn-timeline-friend", 
    title: "Delete friend request"
  end
  
  def unfriend_btn(user)
    link_to 'Friends', friendship_path(user),  
    method: :delete, 
    data: { confirm: 'You are about to unfriend this friend?' },
    class: "btn btn-timeline-friend", 
    title: "Click to Unfriend"
  end
  
  
  def count_friends_for(user)
    return Friendship
    .confirmed_friends_for(user)
    .size if has_friends?(user)
    
    'no friends yet'
  end
  
  def has_friends?(user)
    Friendship
    .confirmed_friends_for(user).any?
  end
  
  def friends_for(user)
     return Friendship
    .confirmed_friends_for(user)
    .limit(5)
    
  end
  
   def has_mutual_friends_with?(user)
    Friendship
    .mutual_friends_between(current_user, user)
     .any? && current_user != user
  end
  
  def mutual_friends_with(user)
     return Friendship
    .mutual_friends_between(current_user, user)
    .limit(5)
  end
  
end
