Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  	mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  	resources :posts do
        member do
            put "like" => "posts#upvote"
            put "unlike" => "posts#downvote"
        end
  		resources :comments, module: :posts
	end

  	devise_for :users, :controllers => { :omniauth_callbacks => "callbacks",
                                        registrations: 'registrations'}
 	 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  	root "posts#index"

end
