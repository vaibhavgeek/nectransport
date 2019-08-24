Rails.application.routes.draw do
  get 'home/index'
  get 'home/login'
  get 'home/form'
  get 'home/matches'
  get 'home/chat'
  get 'home/notify'
  get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
