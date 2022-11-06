Rails.application.routes.draw do
  
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'tags/index'
    get 'tags/edit'
  end
  namespace :admin do
    get 'games/index'
    get 'games/new'
    get 'games/show'
    get 'games/edit'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/confirm'
  end
  namespace :public do
    get 'comments/new'
  end
  namespace :public do
    get 'reviews/new'
  end
  namespace :public do
    get 'games/index'
    get 'games/show'
    get 'games/pc'
    get 'games/ps'
    get 'games/switch'
    get 'games/portable'
    get 'games/smartphone'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  # 顧客用
  # URL /users/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
end
