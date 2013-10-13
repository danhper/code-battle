Dmtc::Application.routes.draw do

  get "codes/index"
  get "codes/new"
  root to: 'quests#index'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :users

  resources :guilds do
    member do
      post 'enter'
      delete 'leave'
    end
  end

  resources :comments, only: [:create]

  resources :quests do
    resources :codes do
      member do
        post 'like'
        delete 'unlike'
      end
    end
  end

  resources :quests do
    resources :codes do
      member do
        post 'vote'
        delete 'unvote'
      end
    end
  end
end
