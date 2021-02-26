Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  get "/about" => "homes#about"
  
  resources :users, only: [:show, :edit, :update]
  
  
  root to: 'homes#top'
end
