Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords,], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    resources :posts, only: [:index, :destroy]
    resources :customers, only: [:index, :destroy]
  end
  scope module: :public do
    get  "homes/about"  => "homes#about"
    root :to => 'homes#top'
    resources :posts do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :customers, only: [:show, :edit, :update, :index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
