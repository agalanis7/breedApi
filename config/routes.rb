Rails.application.routes.draw do

    namespace :v1 do
      resources :users 
    end

    post '/login' => "sessions#create"
    delete '/logout' => "sessions#destroy"
    resources :users
    get '/profile' => "users#profile"

end
