Rails.application.routes.draw do
	devise_for :users, path_names: {
		sign_in: 'login', sign_out: 'logout', sign_up: 'signup'
	}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	
	# devise_for :users, skip: :all
	# devise_scope :user do
	# get 'login', to: 'devise/sessions#new'
	# 	get 'logout', to: 'devise/sessions#destroy'
	# 	get 'signup', to: 'devise/registrations#new'
	# end
	
	root to: 'home#index'
end
