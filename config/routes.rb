Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations", omniauth_callbacks: 'callbacks' }
    devise_scope :user do 
      get 'login', to: 'devise/sessions#new'
    end
    devise_scope :user do 
      get 'signup', to: 'devise/registrations#new'
    end

  resources :notes

  authenticated :user do 
    root 'notes#index', as: 'authenticated_root'
  end
  
  root 'pages#home'
end
