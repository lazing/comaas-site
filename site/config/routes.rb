Rails.application.routes.draw do
  devise_for :users
  #get 'home/welcome'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#welcome'
end
