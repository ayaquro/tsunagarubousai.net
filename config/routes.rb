Rails.application.routes.draw do
  namespace :general_user do
    get 'general_users/show'
    get 'general_users/edit'
  end
  #一般ユーザー用
  #URL /general_users/sign_in ...
  #コントローラーがどこに存在するか記述
  devise_for :general_users,skip: [:passwords], controllers: {
    registrations: "general_user/registrations",
    sessions: "general_user/sessions"
  }

  #自治体職員用
  #URL /staff/sign_in...
  devise_for :staffs,skip: [:registrations, :passwords], controllers: {
    sessions: "staff/sessions"
  }

  root to: "homes#top"

  scope module: :general_user do
    resources :posts, only: [:new, :create, :index, :edit, :show, :update, :destroy] do
      resource :dangers, only: [:create, :destroy] #1つの投稿に1dangerしかできないため、単数形のresource
      resources :posted_comments, only: [:create, :destroy]
    end
    resources :general_users, only: [:show, :edit, :update]
  end

  # namespace :staff do

  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
