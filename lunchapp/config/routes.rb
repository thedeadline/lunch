Rails.application.routes.draw do
  resources :foodtrucks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
get 'logout', to: 'sessions#destroy', as: 'logout'
get 'auth/:provider/callback', to: 'sessions#create'
get 'auth/failure', to: redirect('/') #where the user is redirected if they don't accept the requested permissions.
get 'home', to: 'home#show'
get 'me', to: 'me#show', as: 'me' #authenticated route that serves information specific to the current user

root to: "home#show"
end
