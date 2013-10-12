Dmtc::Application.routes.draw do
  get "codes/index"
  get "codes/new"
  root to: 'static_pages#index'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :guilds do
    member do
      post 'enter'
      delete 'leave'
    end
  end

  resources :problems do
    resources :codes
  end
end
