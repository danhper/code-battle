Dmtc::Application.routes.draw do
  root to: 'static_pages#index'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :guilds do
    member do
      post 'enter'
      post 'leave'
    end
  end
end
