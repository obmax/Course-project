Rails.application.routes.draw do
devise_for :users ,only: :omniauth_callbacks, controllers: {omniauth_callbacks: "omniauth_callbacks"}
	scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

  		devise_for :users ,skip: :omniauth_callbacks

		resources :manuals do
			resources :comments
			member do
				put "like" => "manuals#vote"
			end
		end
		resources :steps
		resources :tags, only: [:show]
		resources :categories, only: [:show]
  		resources :uploads, only: [:index, :create]
		root 'manuals#index'
		resources :users, only: [:show]
		get "search", to: "search#search"

		namespace :admin do
			resources :categories, except: [:show]	
			resources :users, except: [:show]	
			delete 'user/delete_user', :as => :delete_user
			delete 'user/ban_user', :as => :ban_user
			delete 'user/unban_user', :as => :unban_user
		end

	end
end
