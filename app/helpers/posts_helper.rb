module PostsHelper
	
	def show_post_actions_for(post)
		"#{ edit_button_for post}
			#{ change_post_date_for post}
			#{dropdown_item_divider}
			#{ hide_from_timeline_for post}
			#{delete_button_for post}".html_safe if user_can_modify?(post)
	end
	
	def user_can_modify?(post)
		post.user == current_user
	end
	
	def edit_button_for(resource)
		# content_tag(:a, 'Edit', href: edit_post_path(resource), class: 'edit-button')
		link_to 'Edit post', edit_post_path(resource), 
		class: 'dropdown-item'
	end
	
	def delete_button_for(resource)
		# content_tag(:a, 'Delete', href: '#', class: 'edit-button')
		link_to 'Delete', resource, 
			method: :delete, 
			data: { confirm: 'You are about to delete this post. Do you want to continue?' }, 
			class: 'dropdown-item text-danger'
	end
	
	def hide_from_timeline_for(resource)
		# content_tag(:a, 'Edit', href: edit_post_path(resource), class: 'edit-button')
		link_to 'Hide from timeline', '#', 
		class: 'dropdown-item'
	end
	
	def change_post_date_for(resource)
		# content_tag(:a, 'Edit', href: edit_post_path(resource), class: 'edit-button')
		link_to 'Change date', '#', 
		class: 'dropdown-item'
	end
	def dropdown_item_divider
		content_tag(:div, '', class: 'dropdown-divider')
	end
	
end
