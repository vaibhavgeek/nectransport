Rails.application.routes.draw do
  get 'home/index'
  get 'home/login'
  get 'home/form'
  get 'home/matches'
  get 'home/chat'
  get 'home/notify'
  get 'home/index'
  post 'home/otp'
  root 'home#index'
  post 'home/play'
  resources :messages, only: [:new , :create] 
  post 'home/notif'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
