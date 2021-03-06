Rails.application.routes.draw do
	
  get 'posts/index'
  get 'posts/show'
	devise_for :users, path_names: {
		sign_in: 'login', sign_out: 'logout', sign_up: 'signup'
	}, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
	
	resources :users, only: [:index, :show]
	resources :posts, only: [:index,  :create, :edit, :update, :destroy]
	resources :comments, only: [:create, :destroy]
	resources :likes, only: [:create, :destroy]
  resources :friendships, only: [:create, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	
  get '/friends', to: 'friendships#index'
  get '/friend_requests', to: 'friendships#friend_requests'
  
  
	unauthenticated do
		as :user do
			root to: 'devise/registrations#new'
		end
	end
	# authenticated do
	# 	as :user do
	# 		root to: 'home#index'
	# 	end
	# end
	# devise_for :users, skip: :all
	# devise_scope :user do
	# get 'login', to: 'devise/sessions#new'
	# 	get 'logout', to: 'devise/sessions#destroy'
	# 	get 'signup', to: 'devise/registrations#new'
	# end
	
	root to: 'posts#index'
end
