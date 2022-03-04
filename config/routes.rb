Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home', as: 'rause'
  get "meetings", to: "meetings#index"
  get "meetings/new", to: "meetings#new", as: 'new_meeting'
  get "meetings/show", to: "meetings#show", as: 'show_meeting'
  post "meetings", to: "meetings#create", as: 'create_meeting'
  delete '/meetings/:id', to: 'meetings#destroy', as:'delete_meeting'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
