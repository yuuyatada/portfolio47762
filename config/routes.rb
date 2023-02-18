Rails.application.routes.draw do
 
  devise_scope :user do
  post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

 #管理者ログインの指定
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

 #ユーザ側のログイン指定
devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}



 #レシピのルーティング
  resources :recipes do
   resource :favorites, only: [:create, :destroy] 
   resources :user_comments, only:[:create,:destroy]
  end
  
    namespace :admin do
     root to: 'homes#top'
     resources :recipes, only: [:index, :show, :edit, :destroy]
     resources :user_comments, only:[:destroy]
     resources :users,only: [:index,:show,:edit,:update]
  end
  
  resources :users,only: [:show,:edit,:update] do
   #退会機能関係
     collection do
       get 'quit'
       patch 'out'
     end
     #いいねの一覧に飛ぶ
    member do
    get :favorites
    end
   end

 #homes側のルーティング
  get 'homes/top'
  get 'homes/about'
  root to: "homes#top"
  get "search" => "searches#search"
  
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
