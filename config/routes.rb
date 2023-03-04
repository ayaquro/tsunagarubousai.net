Rails.application.routes.draw do
  namespace :public do
    get 'posts/new'
    get 'posts/index'
    get 'posts/edit'
    get 'posts/show'
    post 'posts' => 'posts#create'
  end
  namespace :public do
    get 'homes/top'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
