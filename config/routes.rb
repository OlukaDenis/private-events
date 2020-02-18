Rails.application.routes.draw do
  root 'events#index'

  get 'login', to:'sessions#new'
  post 'login', to:'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to:'users#new'
  post 'signup', to:'users#create'

  post 'attendances', to: 'attendances#attend_event'
  delete 'attendances', to: 'attendances#leave_event'

  resources :users
  resources :events
end
