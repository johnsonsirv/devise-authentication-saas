Rails.application.routes.draw do
	
  get 'posts/index'
  get 'posts/show'
	devise_for :users, path_names: {
		sign_in: 'login', sign_out: 'logout', sign_up: 'signup'
	}, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
	
	resources :users, only: [:index, :show]
	resources :posts, only: [:index,  :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	
	unauthenticated do
		as :user do
			root to: 'devise/registrations#new'
		end
	end
	# devise_for :users, skip: :all
	# devise_scope :user do
	# get 'login', to: 'devise/sessions#new'
	# 	get 'logout', to: 'devise/sessions#destroy'
	# 	get 'signup', to: 'devise/registrations#new'
	# end
	
	root to: 'post#index'
end
