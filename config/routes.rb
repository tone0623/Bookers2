Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  get "/home/about" => "homes#about"
  
  resources :users, only: [:show, :edit, :update, :index]
  resources :books, only: [:show, :new, :create, :index,  :destroy, :edit, :update]
  
  root to: 'homes#top'
end
