Rails.application.routes.draw do
  get '/', to: "home#index"
  get '/user', to: "users#profile"
  get '/user/edit', to: "users#edit"

  get '/upload', to: "resources#upload"
  get '/resource', to: "resources#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
