# frozen_string_literal: true

Rails.application.routes.draw do
  # 一般ユーザー用
  # URL /general_users/sign_in ...
  # コントローラーがどこに存在するか記述
  devise_for :general_users, skip: [:passwords], controllers: {
    registrations: "general_user/registrations",
    sessions: "general_user/sessions"
  }

  #ゲストログイン用
  devise_scope :general_user do
    post 'general_user/guest_sign_in', to: 'general_user/sessions#guest_sign_in'
  end

  # 自治体職員用
  # URL /staff/sign_in...
  devise_for :staffs, skip: [:registrations, :passwords], controllers: {
    sessions: "staff/sessions"
  }

  root to: "homes#top"
  #会員側のルーティング設定
  scope module: :general_user do
    resources :posts, only: [:new, :create, :index, :edit, :show, :update, :destroy] do
      resource :dangers, only: [:create, :destroy] # 1つの投稿に1dangerしかできないため、単数形のresource
      resources :posted_comments, only: [:create, :destroy]
    end
    resources :general_users, only: [:show, :edit, :update]
  end
  #管理者側のルーティング設定
  namespace :staff do
    resources :general_users, only: [:index, :show, :edit, :update]
    resources :districts, only: [:index, :create, :edit, :update]
    resources :posts, only: [:index, :show, :edit, :update, :destroy] do
      resources :posted_comments, only: [ :destroy]
    end
    resources :posted_comments, only: [:index]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end