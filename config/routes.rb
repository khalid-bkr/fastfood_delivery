Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#landing'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :addresses, except: [:show]
    resources :orders
  end

  resources :items

end
