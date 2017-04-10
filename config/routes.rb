Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  	mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  	resources :posts do
  		resources :comments, module: :posts
	end
	
  	devise_for :users, :controllers => { :omniauth_callbacks => "callbacks"}
 	 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  	root "posts#index"

end