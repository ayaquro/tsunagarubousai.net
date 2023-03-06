Rails.application.routes.draw do
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
   namespace :general_user do
    resources :posts, only: [:new, :create, :index, :edit, :show, :update, :destroy]
   end
  # namespace :public do
    root to: "homes#top"
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
