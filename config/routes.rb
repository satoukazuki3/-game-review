Rails.application.routes.draw do
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }
  
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :users, only: [:index,:show,:edit,:update]
    resources :reviews, only: [:index,:show,:edit,:new,:create,:destroy,:update] do
      resources :comments, only: [:create, :destroy]
    end
  end
  namespace :admin do
    get '/' => 'homes#top'
    resources :genres, only: [:create, :edit, :index, :update]
    resources :reviews, only: [:index,:show,:destroy,]
    resources :users, only: [:index,:show,:edit,:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
