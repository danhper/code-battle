Dmtc::Application.routes.draw do

  root to: 'quests#index'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :users, except: [:destroy, :new, :create] do
    member do
      post 'promote'
      delete 'demote'
    end
  end

  resources :guilds do
    member do
      post 'enter'
      delete 'leave'
    end
  end

  resources :comments, only: [:update, :create, :destroy]

  resources :quests do
    member do
      get 'battle'
      get 'battle/:battle_id', to: 'quests#see_battle', as: :see_battle
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
