module PostsHelper
	
	def show_post_actions_for(post)
		"#{ edit_button_for post} |
			#{delete_button_for post}".html_safe if user_can_modify?(post)
	end
	
	def user_can_modify?(post)
		post.user == current_user
	end
	
	def edit_button_for(resource)
		# content_tag(:a, 'Edit', href: edit_post_path(resource), class: 'edit-button')
		link_to 'Edit', edit_post_path(resource), 
		class: 'edit-post'
	end
	
	def delete_button_for(resource)
		# content_tag(:a, 'Delete', href: '#', class: 'edit-button')
		link_to 'Delete', resource, 
			method: :delete, 
			data: { confirm: 'You are about to delete this post. Do you want to continue?' }, 
			class: 'delte-post'
	end
end
