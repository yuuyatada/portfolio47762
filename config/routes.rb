Rails.application.routes.draw do
 
 
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
  resources :recipes
  
  resources :users,only: [:show,:edit] do
     collection do
       get 'quit'
       patch 'out'
     end
   end
  
 #homes側のルーティング
  get 'homes/top'
  get 'homes/about'
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
