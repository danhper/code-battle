Dmtc::Application.routes.draw do

  root to: 'quests#index'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :users, except: [:destroy, :new, :create]

  resources :guilds do
    member do
      post 'enter'
      delete 'leave'
    end
  end

  resources :comments, only: [:create]

  resources :quests do
    member do
      get 'battle'
    end

    resources :codes do
      member do
        post 'like'
        delete 'unlike'
        post 'vote'
        delete 'unvote'
      end
    end
  end
end
