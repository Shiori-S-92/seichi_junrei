Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  ## 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'top' => 'homes#top', as: 'top'
    # root to: 'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
    resources :posts, only: [:index, :show, :destroy] do
      resources :post_comments, only: [:destroy]
    end
  end

  ## ユーザー用
  # URL /users/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    root 'homes#top'
    get '/about' => 'homes#about', as: 'about'
    # get 'users/mypage' => 'users#show', as: 'mypage'


    ## users/editのようにするとdeviseのルーティングとかぶってしまうためinformationを付け加えている。
    get 'users/information/edit' => 'users#edit', as: 'edit_information'
    patch 'users/information' => 'users#update', as: 'update_information'
    put 'users/information' => 'users#update'

    # ↓ ユーザーの退会確認画面
    get 'users/unsubscribe' => 'users#unsubscribe', as: 'confirm_unsubscribe'
    # ↓ ユーザーの退会処理(ステータスの更新)
    patch 'users/withdraw' => 'users#withdraw', as: 'withdraw_user'

    resources :users, only: [:show]
    resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
    end
  end
end
